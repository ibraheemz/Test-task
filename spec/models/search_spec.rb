require 'rails_helper'

RSpec.describe Search, type: :model do
  it 'is valid with valid attributes' do
    search = Search.new(ip_address: '127.0.0.1', term: 'hello')
    expect(search).to be_valid
  end

  it 'is not valid withoud ip_address' do
    search = Search.new(ip_address: nil)
    expect(search).to_not be_valid
  end

  it 'is not valid withoud term' do
    search = Search.new(term: nil)
    expect(search).to_not be_valid
  end
end
