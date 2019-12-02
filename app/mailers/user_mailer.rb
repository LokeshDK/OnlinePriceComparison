class UserMailer < ApplicationMailer

default :from => "admin@onlinepricecomparison.com"

def welcome_email (mail_id)
  @user = params[:user]
  @url  = 'http://example.com/login'
  mail(to: @user.email,from: "Notification", subject: 'Notification from OnlincePriceComparison')
end

end