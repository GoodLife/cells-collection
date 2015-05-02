require 'active_support/cache'

module Cell
  module Caching
    module ClassMethods
      def render_cell_collection_for(name, state, *args)
        args_for_single = args.dup
        collection = args[1]

        return '' if collection.empty?

        item_to_key = {}
        item_to_key.compare_by_identity
        item_to_cell = {} # Cache initialized cell object
        item_to_cell.compare_by_identity

        # Create item-key mapping table for cacheable cells
        collection.each do |item|
          args_for_single[1] = item # Prepare args for single item
          cell = cell_for(name, *args_for_single)

          item_to_cell[item] = cell

          if cell.cache?(state, *args)
            # Remove first arg, because compute_key does not want the cell object as first argument.
            # I don't know where is this stripped in single cell rendering code.
            item_to_key[item] = cell.compute_key(state, *(args_for_single[1..-1]))
          end
        end

        # cache.read_multi & cache.write interfaces may require mutable keys, ie. dalli 2.6.0
        mutable_keys = item_to_key.values.map(&:dup)

        if options = cache_options[state]
          cached = cache_store.read_multi(*mutable_keys, options)
        else
          cached = cache_store.read_multi(*mutable_keys)
        end

        rendered = ''

        collection.each do |item|
          # Get key of item, and check if cached has that key
          if cached_result = cached[item_to_key[item]]
            rendered << cached_result
          else
            cell = item_to_cell[item]
            yield cell if block_given?

            args_for_single[1] = item # Prepare args for single item
            rendered << render_cell_state(cell, state, *args_for_single)
          end
        end

        return rendered.html_safe
      end
    end

    def compute_key(state, *args)
      self.class.state_cache_key(state, call_state_versioner(state, *args))
    end
  end
end
