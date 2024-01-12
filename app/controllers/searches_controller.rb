class SearchesController < ApplicationController

    # before_action :set_search, only: [:create]

    def index
        @articles = Article.where("title Like ? OR body LIKE ?", "%#{params[:term]}%", "%#{params[:term]}%")
        raise "Debug info: #{@articles}"
        render json: @articles
    end

    def create 
        term = params[:search][:term]
        ip_address = request.remote_ip
        # Search.create(term: term, ip_address: ip_address)
        @user = User.find_or_create_by(ip_address: request.remote_ip)
        @user.searches.create(term: term)

    end

    

    private

    # def set_search
    #     @search = Search.find_or_create_by(ip_address: request.remote_ip)
    # end

end
