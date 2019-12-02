require 'my_logger'

class ProductinfoObserver < ActiveRecord::Observer
  def after_update(record)
# use the MyLogger instance method to retrieve the single instance/object of the class
    @logger = MyLogger.instance
# use the logger to log/record a message about the updated car
#@user = User.find(params[:record.user_id])
    @user = User.find(record.user_id)
  #@profile = Profile.find(record.user_id)
    profile_id = Profile.find_by(user_id: record.user_id).id
    @profile = Profile.find(profile_id)
    @logger.logInformation("+++ ProductObserver: The price of #{record.productname} has been updated. New price is #{record.productprice} Updated by  #{@profile.firstname} #{@profile.lastname} #{@user.email}")
      #UserMailer.with(user: @user).welcome_email.deliver
  end

  def after_create(record)
# use the MyLogger instance method to retrieve the single instance/object of the class
    @logger = MyLogger.instance
# use the logger to log/record a message about the updated car
    @logger.logInformation("+++ ProductObserver: A new product #{record.productname} has been created. The price is #{record.productprice}")
  end

end
