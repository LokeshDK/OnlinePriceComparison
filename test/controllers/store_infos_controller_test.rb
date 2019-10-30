require 'test_helper'

class StoreInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_info = store_infos(:one)
  end

  test "should get index" do
    get store_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_store_info_url
    assert_response :success
  end

  test "should create store_info" do
    assert_difference('StoreInfo.count') do
      post store_infos_url, params: { store_info: { address: @store_info.address, branches: @store_info.branches, buisness_id: @store_info.buisness_id, contact_no: @store_info.contact_no, phone_no: @store_info.phone_no, store_incharge: @store_info.store_incharge, store_name: @store_info.store_name } }
    end

    assert_redirected_to store_info_url(StoreInfo.last)
  end

  test "should show store_info" do
    get store_info_url(@store_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_info_url(@store_info)
    assert_response :success
  end

  test "should update store_info" do
    patch store_info_url(@store_info), params: { store_info: { address: @store_info.address, branches: @store_info.branches, buisness_id: @store_info.buisness_id, contact_no: @store_info.contact_no, phone_no: @store_info.phone_no, store_incharge: @store_info.store_incharge, store_name: @store_info.store_name } }
    assert_redirected_to store_info_url(@store_info)
  end

  test "should destroy store_info" do
    assert_difference('StoreInfo.count', -1) do
      delete store_info_url(@store_info)
    end

    assert_redirected_to store_infos_url
  end
end
