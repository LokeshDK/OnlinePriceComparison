require 'tescoProductSearch'

class HomeController < ApplicationController
  def Index

    if !current_user.nil?
    if Profile.where(user_id: current_user.id)[0].nil?
      redirect_to new_profile_path
    end
    end

    @search = params["search"]
    if @search.present?
      @productname = @search["productname"]
      @productSearch = Productinfo.where("lower(productname) like ?", "%#{@productname.downcase}%")
      @order_item = current_order.order_items.new
    end

    if @search.present? &&  @productSearch.empty?
      prodSearch = @search["productname"]
      @tescoProduct = TescoProductSearch.find(prodSearch)
    elsif @productSearch.present? == false
    @productList = Productinfo.all.order(:id)
  end

    if @productList.present?
      @productHash = {}
      for product in @productList
        if @productHash.has_key?(product.productname)
          @productHash[product.productname].push("#{product.id}")
        else
          @productHash[product.productname] = ["#{product.id}"]
        end
      end
    end
  end
end
