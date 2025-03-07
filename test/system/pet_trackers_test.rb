require "application_system_test_case"

class PetTrackersTest < ApplicationSystemTestCase
  setup do
    @pet_tracker = pet_trackers(:one)
  end

  test "visiting the index" do
    visit pet_trackers_url
    assert_selector "h1", text: "Pet trackers"
  end

  test "should create pet tracker" do
    visit pet_trackers_url
    click_on "New pet tracker"

    fill_in "Brand", with: @pet_tracker.brand
    fill_in "Date", with: @pet_tracker.date
    fill_in "Description", with: @pet_tracker.description
    fill_in "Dry amount", with: @pet_tracker.dry_amount
    fill_in "Dry left amount", with: @pet_tracker.dry_left_amount
    fill_in "Time", with: @pet_tracker.time
    fill_in "Wet amount", with: @pet_tracker.wet_amount
    fill_in "Wet left amount", with: @pet_tracker.wet_left_amount
    click_on "Create Pet tracker"

    assert_text "Pet tracker was successfully created"
    click_on "Back"
  end

  test "should update Pet tracker" do
    visit pet_tracker_url(@pet_tracker)
    click_on "Edit this pet tracker", match: :first

    fill_in "Brand", with: @pet_tracker.brand
    fill_in "Date", with: @pet_tracker.date
    fill_in "Description", with: @pet_tracker.description
    fill_in "Dry amount", with: @pet_tracker.dry_amount
    fill_in "Dry left amount", with: @pet_tracker.dry_left_amount
    fill_in "Time", with: @pet_tracker.time.to_s
    fill_in "Wet amount", with: @pet_tracker.wet_amount
    fill_in "Wet left amount", with: @pet_tracker.wet_left_amount
    click_on "Update Pet tracker"

    assert_text "Pet tracker was successfully updated"
    click_on "Back"
  end

  test "should destroy Pet tracker" do
    visit pet_tracker_url(@pet_tracker)
    click_on "Destroy this pet tracker", match: :first

    assert_text "Pet tracker was successfully destroyed"
  end
end
