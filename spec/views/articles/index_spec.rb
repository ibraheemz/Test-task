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

    it 'renders list of articles' do
        expect(rendered).to have_selector('h1', text: 'Articles')
        expect(rendered).to have_selector('.article-container', count: 1)
        expect(rendered).to have_selector('h3', text: articles[0].title)
        expect(rendered).to have_selector('p.italic', text: articles[0].body)
    end
end