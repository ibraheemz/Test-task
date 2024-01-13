require 'rails_helper'

RSpec.describe SearchAnalyzer do
  describe 'when there are searches' do
    context 'when user has one term' do
      it 'returns array of hash with term and count to 1' do
        create(:search, term: 'hello', ip_address: '127.0.0.1')

        expect SearchAnalyzer.new.call == [{ term: 'hello', count: 1 }]
      end
    end

    context 'when user has the same term twice' do
      it 'returns array of hash with term and count to 1' do
        create(:search, term: 'hello', ip_address: '127.0.0.1')
        create(:search, term: 'hello', ip_address: '127.0.0.1')

        expect SearchAnalyzer.new.call == [{ term: 'hello', count: 1 }]
      end
    end

    context 'when multiple users has the same term' do
      it 'returns array of hash with term and count to 2' do
        create(:search, term: 'hello', ip_address: '127.0.0.1')
        create(:search, term: 'hello', ip_address: '127.0.0.2')

        expect SearchAnalyzer.new.call == [{ term: 'hello', count: 2 }]
      end
    end
  end
end
