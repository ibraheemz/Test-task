class SearchesController < ApplicationController

    def create
        ip_address = request.remote_ip
        @search = Search.new(search_params.merge(ip_address: ip_address))

        respond_to do |format|
            if @search.save
                format.json {render json: @search, status: :created}
            else
                format.json {render json: @search.errors, status: :unprocessable_entity}
            end
        end
    end

    def index
        @recordsByIp = Search.group(:ip_address).select("ip_address, string_agg(term, ',') AS terms")
        
        @recordsByIp.each do |record| 
            termsArray = []
            record.terms.split(',').each do |term|
            termHash = termsArray.find { |hash| hash[:term] == term }
                if termHash
                    termHash[:count] ||=0
                    termHash[:count] += 1
                else
                    termsArray << { term: term, count: 1 }
                end
                
            end
            sortedTermsArray = termsArray.sort_by { |hash| -hash[:count].to_i }
            record.terms = sortedTermsArray.to_json
        end
    end

    

    private
    def search_params
        params.require(:search).permit(:term)
    end

end
