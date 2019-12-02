class UserMailer < ApplicationMailer

default :from => "admin@onlinepricecomparison.com"


def welcome_email
  @user = params[:user]
  @url  = 'http://onlinegrocerycomparison.com'
  mail(to: @user.email,from: "Notification", subject: 'Notification from OnlincePriceComparison')
end

def order_email
  @user = params[:user]
  #@profile = Profile.where(user_id: @user.id)
  @profile = Profile.find_by(user_id: @user.id)
  @url  = 'http://onlinegrocerycomparison.com'
  mail(to: @user.email,from: "orders", subject: 'A new order has been placed')
end

end