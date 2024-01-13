require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'is valid with valid attributes' do
    article = Article.new(title: 'test title', body: 'body title')
    expect(article).to be_valid
  end

  it 'is not valid withoud title' do
    article = Article.new(title: nil)
    expect(article).to_not be_valid
  end

  it 'is not valid withoud body' do
    article = Article.new(body: nil)
    expect(article).to_not be_valid
  end
end
