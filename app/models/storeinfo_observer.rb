require 'my_logger'

class StoreinfoObserver < ActiveRecord::Observer
  def after_update(record)
# use the MyLogger instance method to retrieve the single instance/object of the class
    @logger = MyLogger.instance
# use the logger to log/record a message about the updated car
    @logger.logInformation("+++ StoreObserver: The details of store #{record.storename} has been updated.")
  end

  def after_create(record)
# use the MyLogger instance method to retrieve the single instance/object of the class
    @logger = MyLogger.instance
# use the logger to log/record a message about the updated car
    @logger.logInformation("+++ A new store #{record.storename} has been created. ")
  end

end
