class CompareController < ApplicationController
  def index
    @productName = params[:pdName]
    @productId = params[:pdID]

    @order_item = current_order.order_items.new
  end
end
