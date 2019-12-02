class UserMailer < ApplicationMailer

default :from => "admin@onlinepricecomparison.com"


def welcome_email
  @user = params[:user]
  @url  = 'http://onlinegrocerycomparison.com'
  mail(to: @user.email,from: "Notification", subject: 'Notification from OnlincePriceComparison')
end

def order_email
  @user = params[:user]
  @url  = 'http://onlinegrocerycomparison.com'
  mail(to: @user.email,from: "orders", subject: 'New order placed!')
end

end