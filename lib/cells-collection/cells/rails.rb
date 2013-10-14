module Cells
  module Rails
    module ActionController
      def render_cell_collection(name, state, *args, &block)
        ::Cell::Rails.render_cell_collection_for(name, state, self, *args, &block)
      end
    end

    module ActionView
      def render_cell_collection(name, state, *args, &block)
        ::Cell::Rails.render_cell_collection_for(name, state, controller, *args, &block)
      end
    end
  end
end
