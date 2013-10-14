require 'cells/rails'
require 'cells-collection/cells/rails'

describe Cells::Rails::ActionView do
  describe '#render_cell_collection' do
    subject{ Object.new.extend(Cells::Rails::ActionView) }
    it 'calls render_cell_collection_for' do
      ::Cell::Rails.should_receive(:render_cell_collection)
      subject.render_cell_collection
    end
  end
end
