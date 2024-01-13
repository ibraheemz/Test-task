require 'rails_helper'

RSpec.describe 'searches/index', type: :view do
    before do
        assign(:records_trending_trems, [
            { 'term' => 'ipsum', 'count' => '6' },
            { 'term' => 'lorem', 'count' => '2' }
        ])
        render
    end

    it 'renders a table with search analytics' do
        expect(rendered).to have_selector('table')
        #1 for table heads & 2 for each term
        expect(rendered).to have_selector('tr', count: 3)
        expect(rendered).to include("ipsum")
        expect(rendered).to include("6")
        expect(rendered).to include("lorem")
    end
end