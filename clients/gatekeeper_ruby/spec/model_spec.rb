require 'spec_helper'
require 'support/models/article'

describe 'basics' do
  it "inherits from Gatekeeper::Model" do
    Article.ancestors.should include Gatekeeper::Model
  end
end
# article_updated = lambda do |article, verb|
#   p article, verb
# end

# articles = Article.all(article_updated)
# article = articles.first
# article.callbacks.push article_updated
# article.callbacks.push article_updated

# puts "I defined 3 callbacks. now i will trigger an event and expect to see 'created' 3 times"

