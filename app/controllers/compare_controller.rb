class CompareController < ApplicationController
  def index
    @productName = params[:pdName]
    @productId = params[:pdID]
  end
end
