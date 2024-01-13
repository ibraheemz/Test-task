require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @articles with all articles' do
      articles = FactoryBot.create_list(:article, 3)
      created_articles_ids = articles.map(&:id)

      get :index
      expect(assigns(:articles).map(&:id)).to include(*created_articles_ids)
    end
  end

  describe 'GET #search' do
    it 'renders JSON with articles matching the search term' do
      article1 = FactoryBot.create(:article, title: 'Matching Article', body: 'Content')
      article2 = FactoryBot.create(:article, title: 'Not the same', body: 'Another ')

      get :search, params: { term: 'Matching' }, format: :json
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response.size).to eq(1)
      expect(json_response[0]['title']).to eq(article1.title)
      expect(json_response[0]['body']).to eq(article1.body)
    end
  end
end