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
  end
end
