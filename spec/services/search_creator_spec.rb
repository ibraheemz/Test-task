require 'rails_helper'

RSpec.describe SearchCreator do
  describe 'when passing valid params' do
    context 'when using same ip_address' do
      let(:ip_address) { '127.0.0.1' }

      context 'and term is already a subset of existing one' do
        before { create(:search, term: 'what is a good', ip_address:) }

        it 'is not creating new search' do
          SearchCreator.new('what is a good car', ip_address).call
          expect(Search.count).to eq(1)
        end
      end

      context 'when term is not subset of already existing one' do
        before { create(:search, term: 'test', ip_address:) }

        it 'creates search' do
          SearchCreator.new('what is', ip_address).call
          expect(Search.count).to eq(2)
        end
      end
    end

    context 'when using different ip_address' do
      context 'and term is already a subset of existing one' do
        before { create(:search, term: 'how are you', ip_address: '127.0.0.1') }

        it 'creates search' do
          SearchCreator.new('how are', '127.0.0.2').call
          expect(Search.count).to eq(2)
        end
      end

      context 'when term is not subset of already existing one' do
        before { create(:search, term: 'test', ip_address: '127.0.0.1') }

        it 'creates search' do
          SearchCreator.new('how are', '127.0.0.2').call
          expect(Search.count).to eq(2)
        end
      end
    end
  end

  describe 'when passing invalid params' do
    it 'returns error' do
      search = SearchCreator.new(nil, '127.0.0.1').call
      expect(search.persisted?).to be_falsey
    end
  end
end
