require "test_helper"

class GymPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gym_plan = gym_plans(:one)
  end

  test "should get index" do
    get gym_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_gym_plan_url
    assert_response :success
  end

  test "should create gym_plan" do
    assert_difference("GymPlan.count") do
      post gym_plans_url, params: { gym_plan: { name: @gym_plan.name, number_of_days: @gym_plan.number_of_days } }
    end

    assert_redirected_to gym_plan_url(GymPlan.last)
  end

  test "should show gym_plan" do
    get gym_plan_url(@gym_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_gym_plan_url(@gym_plan)
    assert_response :success
  end

  test "should update gym_plan" do
    patch gym_plan_url(@gym_plan), params: { gym_plan: { name: @gym_plan.name, number_of_days: @gym_plan.number_of_days } }
    assert_redirected_to gym_plan_url(@gym_plan)
  end

  test "should destroy gym_plan" do
    assert_difference("GymPlan.count", -1) do
      delete gym_plan_url(@gym_plan)
    end

    assert_redirected_to gym_plans_url
  end
end
