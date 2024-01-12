class ArticlesController < ApplicationController

    def index
        @articles = Article.where("body Like ? OR title Like ?", "%#{params[:term]}%", "%#{params[:term]}%")
        render json: @articles
    end
end
