require 'test_helper'

class ProductinfosImportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get productinfos_imports_new_url
    assert_response :success
  end

  test "should get create" do
    get productinfos_imports_create_url
    assert_response :success
  end

end
