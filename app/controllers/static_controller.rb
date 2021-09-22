class StaticController < ApplicationController
  def index
    @products = Product.search(params[:title])
  end

  def success; end

  def cancel; end
end
