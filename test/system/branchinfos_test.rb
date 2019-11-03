require "application_system_test_case"

class BranchinfosTest < ApplicationSystemTestCase
  setup do
    @branchinfo = branchinfos(:one)
  end

  test "visiting the index" do
    visit branchinfos_url
    assert_selector "h1", text: "Branchinfos"
  end

  test "creating a Branchinfo" do
    visit branchinfos_url
    click_on "New Branchinfo"

    fill_in "Address", with: @branchinfo.address
    fill_in "Branchincharge", with: @branchinfo.branchincharge
    fill_in "Branchname", with: @branchinfo.branchname
    fill_in "Contactno", with: @branchinfo.contactno
    fill_in "Phoneno", with: @branchinfo.phoneno
    fill_in "Storeinfo", with: @branchinfo.storeinfo_id
    click_on "Create Branchinfo"

    assert_text "Branchinfo was successfully created"
    click_on "Back"
  end

  test "updating a Branchinfo" do
    visit branchinfos_url
    click_on "Edit", match: :first

    fill_in "Address", with: @branchinfo.address
    fill_in "Branchincharge", with: @branchinfo.branchincharge
    fill_in "Branchname", with: @branchinfo.branchname
    fill_in "Contactno", with: @branchinfo.contactno
    fill_in "Phoneno", with: @branchinfo.phoneno
    fill_in "Storeinfo", with: @branchinfo.storeinfo_id
    click_on "Update Branchinfo"

    assert_text "Branchinfo was successfully updated"
    click_on "Back"
  end

  test "destroying a Branchinfo" do
    visit branchinfos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Branchinfo was successfully destroyed"
  end
end
