require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
    describe 'POST #create' do
        it 'creates a new search record' do
            post :create, format: :json, params: { search: { term: 'example' } }

            expect(response).to have_http_status(:created)
            expect(Search.count).to eq(1)
            expect(Search.last.term).to eq("example")
        end

        it 'renders JSON with errors if creation fails' do
            allow_any_instance_of(Search).to receive(:save).and_return(false)

            post :create, format: :json, params: { search: { term: 'example' } }

            expect(response).to have_http_status(:unprocessable_entity)
        end
    end

    describe 'GET #index' do
        it 'returns a list of terms with occurrences count for each term' do
            Search.create(ip_address: '::1', term: 'term example1')
            Search.create(ip_address: '::1', term: 'term example2')

            get :index

            expect(response).to have_http_status(:success)
            expect(assigns(:records_trending_trems)).to be_present
        end
    end


end