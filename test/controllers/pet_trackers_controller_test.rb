require "test_helper"

class PetTrackersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pet_tracker = pet_trackers(:one)
  end

  test "should get index" do
    get pet_trackers_url
    assert_response :success
  end

  test "should get new" do
    get new_pet_tracker_url
    assert_response :success
  end

  test "should create pet_tracker" do
    assert_difference("PetTracker.count") do
      post pet_trackers_url, params: { pet_tracker: { brand: @pet_tracker.brand, date: @pet_tracker.date, description: @pet_tracker.description, dry_amount: @pet_tracker.dry_amount, dry_left_amount: @pet_tracker.dry_left_amount, time: @pet_tracker.time, wet_amount: @pet_tracker.wet_amount, wet_left_amount: @pet_tracker.wet_left_amount } }
    end

    assert_redirected_to pet_tracker_url(PetTracker.last)
  end

  test "should show pet_tracker" do
    get pet_tracker_url(@pet_tracker)
    assert_response :success
  end

  test "should get edit" do
    get edit_pet_tracker_url(@pet_tracker)
    assert_response :success
  end

  test "should update pet_tracker" do
    patch pet_tracker_url(@pet_tracker), params: { pet_tracker: { brand: @pet_tracker.brand, date: @pet_tracker.date, description: @pet_tracker.description, dry_amount: @pet_tracker.dry_amount, dry_left_amount: @pet_tracker.dry_left_amount, time: @pet_tracker.time, wet_amount: @pet_tracker.wet_amount, wet_left_amount: @pet_tracker.wet_left_amount } }
    assert_redirected_to pet_tracker_url(@pet_tracker)
  end

  test "should destroy pet_tracker" do
    assert_difference("PetTracker.count", -1) do
      delete pet_tracker_url(@pet_tracker)
    end

    assert_redirected_to pet_trackers_url
  end
end
