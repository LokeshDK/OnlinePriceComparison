require 'test_helper'

class ProductinfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @productinfo = productinfos(:one)
  end

  test "should get index" do
    get productinfos_url
    assert_response :success
  end

  test "should get new" do
    get new_productinfo_url
    assert_response :success
  end

  test "should create productinfo" do
    assert_difference('Productinfo.count') do
      post productinfos_url, params: { productinfo: { branchinfo_id: @productinfo.branchinfo_id, categorie_id: @productinfo.categorie_id, image: @productinfo.image, productname: @productinfo.productname, productprice: @productinfo.productprice, storeproductid: @productinfo.storeproductid } }
    end

    assert_redirected_to productinfo_url(Productinfo.last)
  end

  test "should show productinfo" do
    get productinfo_url(@productinfo)
    assert_response :success
  end

  test "should get edit" do
    get edit_productinfo_url(@productinfo)
    assert_response :success
  end

  test "should update productinfo" do
    patch productinfo_url(@productinfo), params: { productinfo: { branchinfo_id: @productinfo.branchinfo_id, categorie_id: @productinfo.categorie_id, image: @productinfo.image, productname: @productinfo.productname, productprice: @productinfo.productprice, storeproductid: @productinfo.storeproductid } }
    assert_redirected_to productinfo_url(@productinfo)
  end

  test "should destroy productinfo" do
    assert_difference('Productinfo.count', -1) do
      delete productinfo_url(@productinfo)
    end

    assert_redirected_to productinfos_url
  end
end
