require 'test_helper'

class StoreinfoTest < ActiveSupport::TestCase


  test "store without store name" do
    store = Storeinfo.new(storename: "Test",  phoneno: "12345678")
    assert_equal(false, store.save, "Did not save the store")
  end


end
