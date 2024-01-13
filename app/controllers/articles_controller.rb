class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def search
    @articles = Article.where('body iLike ? OR title iLike ?', "%#{params[:term]}%", "%#{params[:term]}%")
    render json: @articles
  end
end
