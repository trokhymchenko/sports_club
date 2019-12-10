require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase

  def setup
    @workout = Workout.new(title: "MyString", description: "MyText")
  end

  test "workout should be valid" do
    assert @workout.valid?
  end

  test "title should be present" do
    @workout.title = " "
    assert_not @category.valid?
  end

  test "title should be unique" do
    @workout.save
    workout2 = Workout.new(title: "MyString")
    assert_not workout2.valid?
  end

  test "title should not be too long" do
    @workout.title = "a" * 40
    assert_not @workout.valid?
  end
end
