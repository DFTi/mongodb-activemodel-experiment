require 'gatekeeper/remote'
require 'gatekeeper/listener'

module Gatekeeper
  class Model
    attr_accessor :callbacks
    @@callback = lambda{}

    def initialize(json, callback)
      @callbacks = [callback]
    end

    def self.all(callback)
      self.where(self, callback)
    end

    def self.where(query, callback)
      @@callback = callback
      # Query to database
      list = Remote.query query
      list.map{|json| self.new(json, @@callback) }
      # Listening for new objects coming in
      Listener.listen(self) do |json|
        @@callback.call(self.new(json, @@callback), "created")
      end
      list
    end

    def self.find(ids, callback)
      self.where({id:ids}, callback)
    end

    def save
    end
    def delete
    end
  end
end