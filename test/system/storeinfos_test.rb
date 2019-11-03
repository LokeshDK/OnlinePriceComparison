require "application_system_test_case"

class StoreinfosTest < ApplicationSystemTestCase
  setup do
    @storeinfo = storeinfos(:one)
  end

  test "visiting the index" do
    visit storeinfos_url
    assert_selector "h1", text: "Storeinfos"
  end

  test "creating a Storeinfo" do
    visit storeinfos_url
    click_on "New Storeinfo"

    fill_in "Address", with: @storeinfo.address
    fill_in "Branchcount", with: @storeinfo.branchcount
    fill_in "Buisnessid", with: @storeinfo.buisnessid
    fill_in "Contactno", with: @storeinfo.contactno
    fill_in "Image", with: @storeinfo.image
    fill_in "Phoneno", with: @storeinfo.phoneno
    fill_in "Storeincharge", with: @storeinfo.storeincharge
    fill_in "Storename", with: @storeinfo.storename
    click_on "Create Storeinfo"

    assert_text "Storeinfo was successfully created"
    click_on "Back"
  end

  test "updating a Storeinfo" do
    visit storeinfos_url
    click_on "Edit", match: :first

    fill_in "Address", with: @storeinfo.address
    fill_in "Branchcount", with: @storeinfo.branchcount
    fill_in "Buisnessid", with: @storeinfo.buisnessid
    fill_in "Contactno", with: @storeinfo.contactno
    fill_in "Image", with: @storeinfo.image
    fill_in "Phoneno", with: @storeinfo.phoneno
    fill_in "Storeincharge", with: @storeinfo.storeincharge
    fill_in "Storename", with: @storeinfo.storename
    click_on "Update Storeinfo"

    assert_text "Storeinfo was successfully updated"
    click_on "Back"
  end

  test "destroying a Storeinfo" do
    visit storeinfos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Storeinfo was successfully destroyed"
  end
end
