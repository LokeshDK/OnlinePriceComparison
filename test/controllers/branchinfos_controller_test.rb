require 'test_helper'

class BranchinfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @branchinfo = branchinfos(:one)
  end

  test "should get index" do
    get branchinfos_url
    assert_response :success
  end

  test "should get new" do
    get new_branchinfo_url
    assert_response :success
  end

  test "should create branchinfo" do
    assert_difference('Branchinfo.count') do
      post branchinfos_url, params: { branchinfo: { address: @branchinfo.address, branchincharge: @branchinfo.branchincharge, branchname: @branchinfo.branchname, contactno: @branchinfo.contactno, phoneno: @branchinfo.phoneno, storeinfo_id: @branchinfo.storeinfo_id } }
    end

    assert_redirected_to branchinfo_url(Branchinfo.last)
  end

  test "should show branchinfo" do
    get branchinfo_url(@branchinfo)
    assert_response :success
  end

  test "should get edit" do
    get edit_branchinfo_url(@branchinfo)
    assert_response :success
  end

  test "should update branchinfo" do
    patch branchinfo_url(@branchinfo), params: { branchinfo: { address: @branchinfo.address, branchincharge: @branchinfo.branchincharge, branchname: @branchinfo.branchname, contactno: @branchinfo.contactno, phoneno: @branchinfo.phoneno, storeinfo_id: @branchinfo.storeinfo_id } }
    assert_redirected_to branchinfo_url(@branchinfo)
  end

  test "should destroy branchinfo" do
    assert_difference('Branchinfo.count', -1) do
      delete branchinfo_url(@branchinfo)
    end

    assert_redirected_to branchinfos_url
  end
end
