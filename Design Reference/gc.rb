require 'json'

TEST_JSON = {foo:'bar'}.to_json

module GKListener
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

class GKRemote
  def self.query(query)
    puts query
    [TEST_JSON]
  end
end

class GKModel
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
    list = GKRemote.query query
    list.map{|json| self.new(json, @@callback) }
    # Listening for new objects coming in
    GKListener.listen(self) do |json|
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

class Article < GKModel
  attr_accessor :title, :body
end

article_updated = lambda do |article, verb|
  p article, verb
end

articles = Article.all(article_updated)
article = articles.first
article.callbacks.push article_updated
article.callbacks.push article_updated

puts "I defined 3 callbacks. now i will trigger an event and expect to see 'created' 3 times"

