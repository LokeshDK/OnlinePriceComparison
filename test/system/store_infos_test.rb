require "application_system_test_case"

class StoreInfosTest < ApplicationSystemTestCase
  setup do
    @store_info = store_infos(:one)
  end

  test "visiting the index" do
    visit store_infos_url
    assert_selector "h1", text: "Store Infos"
  end

  test "creating a Store info" do
    visit store_infos_url
    click_on "New Store Info"

    fill_in "Address", with: @store_info.address
    fill_in "Branches", with: @store_info.branches
    fill_in "Buisness", with: @store_info.buisness_id
    fill_in "Contact no", with: @store_info.contact_no
    fill_in "Phone no", with: @store_info.phone_no
    fill_in "Store incharge", with: @store_info.store_incharge
    fill_in "Store name", with: @store_info.store_name
    click_on "Create Store info"

    assert_text "Store info was successfully created"
    click_on "Back"
  end

  test "updating a Store info" do
    visit store_infos_url
    click_on "Edit", match: :first

    fill_in "Address", with: @store_info.address
    fill_in "Branches", with: @store_info.branches
    fill_in "Buisness", with: @store_info.buisness_id
    fill_in "Contact no", with: @store_info.contact_no
    fill_in "Phone no", with: @store_info.phone_no
    fill_in "Store incharge", with: @store_info.store_incharge
    fill_in "Store name", with: @store_info.store_name
    click_on "Update Store info"

    assert_text "Store info was successfully updated"
    click_on "Back"
  end

  test "destroying a Store info" do
    visit store_infos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Store info was successfully destroyed"
  end
end
