require 'my_logger'

class ProductinfoObserver < ActiveRecord::Observer
  def after_update(record)
# use the MyLogger instance method to retrieve the single instance/object of the class
    @logger = MyLogger.instance
# use the logger to log/record a message about the updated car
    @logger.logInformation("+++ ProductObserver: The price of #{record.productname} has been updated. New price is #{record.productprice}")
    UserMailer.with(user: current_user).welcome_email.deliver
  end

  def after_create(record)
# use the MyLogger instance method to retrieve the single instance/object of the class
    @logger = MyLogger.instance
# use the logger to log/record a message about the updated car
    @logger.logInformation("+++ ProductObserver: A new product #{record.productname} has been created. The price is #{record.productprice}")
  end

end
