class SearchController < ApplicationController
  def index
    @products = Product.search_query(params[:q]).results
    return if params[:q].blank?
  end
end
