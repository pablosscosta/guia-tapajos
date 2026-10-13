require "application_system_test_case"

class PoisTest < ApplicationSystemTestCase
  setup do
    @poi = pois(:one)
  end

  test "visiting the index" do
    visit pois_url
    assert_selector "h1", text: "Pois"
  end

  test "should create poi" do
    visit pois_url
    click_on "New poi"

    fill_in "Address", with: @poi.address
    fill_in "Category", with: @poi.category
    fill_in "Description", with: @poi.description
    fill_in "Latitude", with: @poi.latitude
    fill_in "Longitude", with: @poi.longitude
    fill_in "Name", with: @poi.name
    click_on "Create Poi"

    assert_text "Poi was successfully created"
    click_on "Back"
  end

  test "should update Poi" do
    visit poi_url(@poi)
    click_on "Edit this poi", match: :first

    fill_in "Address", with: @poi.address
    fill_in "Category", with: @poi.category
    fill_in "Description", with: @poi.description
    fill_in "Latitude", with: @poi.latitude
    fill_in "Longitude", with: @poi.longitude
    fill_in "Name", with: @poi.name
    click_on "Update Poi"

    assert_text "Poi was successfully updated"
    click_on "Back"
  end

  test "should destroy Poi" do
    visit poi_url(@poi)
    click_on "Destroy this poi", match: :first

    assert_text "Poi was successfully destroyed"
  end
end
