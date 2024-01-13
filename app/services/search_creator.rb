class SearchCreator
  def initialize(term, ip_address)
    @term = term
    @ip_address = ip_address
  end

  def call
    clean_terms

    Search.create(term: @term, ip_address: @ip_address)
  end

  private

  def clean_terms
    searches_subset_of_term =
      searche_terms_with_ip_address.select { |other_search| @term.include?(other_search.term) }
    Search.delete(searches_subset_of_term)
  end

  def searche_terms_with_ip_address
    Search.with_ip_address(@ip_address)
  end
end
