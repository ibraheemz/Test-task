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

    def analysis
        @recordsByIp = Search.group(:ip_address, :term).select('ip_address, COUNT(DISTINCT term) as term_count')
        render json: @recordsByIp
    end

    

    private
    def search_params
        params.require(:search).permit(:term)
    end

end
