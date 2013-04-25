require 'json'

TEST_JSON = {foo:'bar'}.to_json

module Gatekeeper
  module Listener
    module_function
    attr_accessor :block
    def listen(channel, &block)
      @block = block
      # set up socket with channel
      # incoming message on channel
        # block.call(json)
      # pretend we got one...
      block.call(TEST_JSON, 'verb')
    end
  end
end