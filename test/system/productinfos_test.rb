require "application_system_test_case"

class ProductinfosTest < ApplicationSystemTestCase
  setup do
    @productinfo = productinfos(:one)
  end

  test "visiting the index" do
    visit productinfos_url
    assert_selector "h1", text: "Productinfos"
  end

  test "creating a Productinfo" do
    visit productinfos_url
    click_on "New Productinfo"

    fill_in "Branchinfo", with: @productinfo.branchinfo_id
    fill_in "Categorie", with: @productinfo.categorie_id
    fill_in "Image", with: @productinfo.image
    fill_in "Productname", with: @productinfo.productname
    fill_in "Productprice", with: @productinfo.productprice
    fill_in "Storeproductid", with: @productinfo.storeproductid
    click_on "Create Productinfo"

    assert_text "Productinfo was successfully created"
    click_on "Back"
  end

  test "updating a Productinfo" do
    visit productinfos_url
    click_on "Edit", match: :first

    fill_in "Branchinfo", with: @productinfo.branchinfo_id
    fill_in "Categorie", with: @productinfo.categorie_id
    fill_in "Image", with: @productinfo.image
    fill_in "Productname", with: @productinfo.productname
    fill_in "Productprice", with: @productinfo.productprice
    fill_in "Storeproductid", with: @productinfo.storeproductid
    click_on "Update Productinfo"

    assert_text "Productinfo was successfully updated"
    click_on "Back"
  end

  test "destroying a Productinfo" do
    visit productinfos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Productinfo was successfully destroyed"
  end
end
