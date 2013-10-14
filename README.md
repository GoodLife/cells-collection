# Cells::Collection

Allows [cell](https://github.com/apotonick/cells) rendering for a collection of items in one go.

This allows Rails to utilize cache store's `get_multi` method. When cache store supports it (e.g. Memcached), this results in only one cache read request for the whole collection.

The performance boost does vary from action to action, so always benchmark to see if it improved the performance. Two biggest boost can happen when:

* Cache store lives at a remote location.
* Collection size over 50 items.

## Installation

Add this line to your application's Gemfile **after** cells gem declaration:

    gem 'cells'
    gem 'cells-collection'

And then execute:

    $ bundle install

To setup Rails to use Memcached store, take look at the [dalli gem](https://github.com/mperham/dalli).

## Usage

Do this in the view:

    <%= render_cell_collection :cart, :item, @items %>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
