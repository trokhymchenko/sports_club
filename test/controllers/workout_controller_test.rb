require 'test_helper'

class WorkoutControllerTest < ActionDispatch::IntegrationTest

  test "should get workouts index" do
    get workouts_path
    assert_response :success
  end

  test "should get new" do
    get new_workout_path
    assert_response :success
  end

end
