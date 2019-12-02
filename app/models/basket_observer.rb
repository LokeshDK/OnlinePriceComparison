require 'my_logger'

class BasketObserver < ActiveRecord::Observer

  def after_create(record)
# use the MyLogger instance method to retrieve the single instance/object of the class
    @logger = MyLogger.instance

# use the logger to log/record a message about the updated car
#@user = User.find(params[:record.user_id]) #

    @user = User.find(record.user_id)
  #@profile = Profile.find(record.user_id)
    profile_id = Profile.find_by(user_id: record.user_id).id
    @profile = Profile.find(profile_id)
    @logger.logInformation("Basket observer: A new basket - #{record.name} has been placed by the user - #{@profile.firstname} #{@profile.lastname}. Mail sent to #{@user.email}")
    UserMailer.with(user: @user).order_email.deliver

  end


end
