require 'my_logger'

class ProductinfoObserver < ActiveRecord::Observer
  def after_update(record)
# use the MyLogger instance method to retrieve the single instance/object of the class
    @logger = MyLogger.instance
# use the logger to log/record a message about the updated car
    @logger.logInformation("###############Observer Demo:#")
    @logger.logInformation("+++ ProductObserver: The price of #{record.productname}
has been updated. New price is #{record.productprice}")
    @logger.logInformation("##############################")
  end
end
