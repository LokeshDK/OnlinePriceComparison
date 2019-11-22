class HomeController < ApplicationController
  def Index
    @search = params["search"]
    if @search.present?
      @productname = @search["productname"]
      @productSearch = Productinfo.where("lower(productname) like ?", "%#{@productname.downcase}%")
    end

    if @productSearch.present? == false
      @productList = Productinfo.all
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
