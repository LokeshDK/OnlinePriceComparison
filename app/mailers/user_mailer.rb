class UserMailer < ApplicationMailer

default :from => "admin@onlinepricecomparison.com"


def welcome_email
  @user = params[:user]
  @url  = 'http://onlinegrocerycomparison.com'
  mail(to: @user.email,from: "Notification", subject: 'Notification from OnlincePriceComparison')
end

def order_email(user, basket)
  @user = user
  @basket = basket
  #@profile = Profile.where(user_id: @user.id)
  @profile = Profile.find_by(user_id: @user.id)
  @url  = 'http://onlinegrocerycomparison.com'
  #@basket = Basket.find_by(id: @basket.id)
  mail(to: @user.email,from: "orders", subject: 'A new order has been placed')
end

def status_change_email(user, basket)
  @user = user
  @basket = basket
  #@profile = Profile.where(user_id: @user.id)
  @profile = Profile.find_by(user_id: @user.id)
  @url  = 'http://onlinegrocerycomparison.com'
  #@basket = Basket.find_by(id: @basket.id)
  mail(to: @user.email,from: "Order Status Update", subject: 'Status of your order has been updated')
end


end