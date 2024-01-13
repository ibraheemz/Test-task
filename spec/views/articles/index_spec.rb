require 'rails_helper'

RSpec.describe 'articles/index', type: :view do
    before do
        assign(:articles, [Article.new(title: 'example title', body: 'example body')])
        render
    end
    articles = [Article.new(title: 'example title', body: 'example body')]

    it 'renders the search form' do
        expect(rendered).to have_selector('form[action="/searches"]')
        expect(rendered).to have_selector('input#search-input')
    end

    it 'renders Most searched keywords link' do
        expect(rendered).to have_link('Most searched keywords', href: searches_path, class: 'button')
    end
end