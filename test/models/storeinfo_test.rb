require 'test_helper'

class StoreinfoTest < ActiveSupport::TestCase
<<<<<<< HEAD

  test "store without store name" do
    store = Storeinfo.new(storename: "Test",  phoneno: "12345678")
    assert_equal(false, store.save, "Did not save the store")
  end

=======
   test "the truth" do
     assert true
   end
>>>>>>> b6ee3c66f5110d2c526d8dced9350b18cf00c225
end
