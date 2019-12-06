require 'test_helper'

class StoreinfoTest < ActiveSupport::TestCase


  test "Create a store and check if it gets stored" do
    store = Storeinfo.new(storename: "Test",  phoneno: "12345678")
    assert_equal(true, store.save, "Store was created")
  end


  test "Create a store with all details empty" do
    store = Storeinfo.new()
    assert_equal(false, store.save, "Did not save the store")
  end



end
