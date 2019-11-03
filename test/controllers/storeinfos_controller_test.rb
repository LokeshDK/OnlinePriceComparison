require 'test_helper'

class StoreinfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @storeinfo = storeinfos(:one)
  end

  test "should get index" do
    get storeinfos_url
    assert_response :success
  end

  test "should get new" do
    get new_storeinfo_url
    assert_response :success
  end

  test "should create storeinfo" do
    assert_difference('Storeinfo.count') do
      post storeinfos_url, params: { storeinfo: { address: @storeinfo.address, branchcount: @storeinfo.branchcount, buisnessid: @storeinfo.buisnessid, contactno: @storeinfo.contactno, image: @storeinfo.image, phoneno: @storeinfo.phoneno, storeincharge: @storeinfo.storeincharge, storename: @storeinfo.storename } }
    end

    assert_redirected_to storeinfo_url(Storeinfo.last)
  end

  test "should show storeinfo" do
    get storeinfo_url(@storeinfo)
    assert_response :success
  end

  test "should get edit" do
    get edit_storeinfo_url(@storeinfo)
    assert_response :success
  end

  test "should update storeinfo" do
    patch storeinfo_url(@storeinfo), params: { storeinfo: { address: @storeinfo.address, branchcount: @storeinfo.branchcount, buisnessid: @storeinfo.buisnessid, contactno: @storeinfo.contactno, image: @storeinfo.image, phoneno: @storeinfo.phoneno, storeincharge: @storeinfo.storeincharge, storename: @storeinfo.storename } }
    assert_redirected_to storeinfo_url(@storeinfo)
  end

  test "should destroy storeinfo" do
    assert_difference('Storeinfo.count', -1) do
      delete storeinfo_url(@storeinfo)
    end

    assert_redirected_to storeinfos_url
  end
end
