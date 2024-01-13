class SearchAnalyzer
  def call
    result = Search.group(:term)
                   .select('term, COUNT(*) as count')
                   .order(:term)

    result.map { |record| { term: record.term, count: record.count } }
  end
end
