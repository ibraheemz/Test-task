class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end

    def search
        @articles = Article.where("body Like ? OR title Like ?", "%#{params[:term]}%", "%#{params[:term]}%")
        render json: @articles
    end
end
