require "application_system_test_case"

class GymPlansTest < ApplicationSystemTestCase
  setup do
    @gym_plan = gym_plans(:one)
  end

  test "visiting the index" do
    visit gym_plans_url
    assert_selector "h1", text: "Gym plans"
  end

  test "should create gym plan" do
    visit gym_plans_url
    click_on "New gym plan"

    fill_in "Name", with: @gym_plan.name
    fill_in "Number of days", with: @gym_plan.number_of_days
    click_on "Create Gym plan"

    assert_text "Gym plan was successfully created"
    click_on "Back"
  end

  test "should update Gym plan" do
    visit gym_plan_url(@gym_plan)
    click_on "Edit this gym plan", match: :first

    fill_in "Name", with: @gym_plan.name
    fill_in "Number of days", with: @gym_plan.number_of_days
    click_on "Update Gym plan"

    assert_text "Gym plan was successfully updated"
    click_on "Back"
  end

  test "should destroy Gym plan" do
    visit gym_plan_url(@gym_plan)
    click_on "Destroy this gym plan", match: :first

    assert_text "Gym plan was successfully destroyed"
  end
end
