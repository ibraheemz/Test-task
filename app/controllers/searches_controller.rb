class SearchesController < ApplicationController
  def create
    @search = SearchCreator.new(search_params[:term], request.remote_ip).call

    respond_to do |format|
      if @search&.persisted?
        format.json { render json: @search, status: :created }
      else
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @records_trending_trems = SearchAnalyzer.new.call
  end

  private

  def search_params
    params.require(:search).permit(:term)
  end
end
