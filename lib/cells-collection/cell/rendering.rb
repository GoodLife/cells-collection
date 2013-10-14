module Cell
  module Rendering
    module ClassMethods
      # Rendering collection of cells
      def render_cell_collection_for(name, state, *args)
        args_for_single = args.dup
        collection = args[1]

        rendered = ''

        collection.each do |item|
          args_for_single[1] = item

          cell = create_cell_for(name, *args_for_single)
          yield cell if block_given?

          rendered << render_cell_state(cell, state, *args_for_single)
        end

        return rendered.html_safe
      end
    end
  end
end
