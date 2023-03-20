class GymPlansController < ApplicationController
  before_action :set_gym_plan, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /gym_plans or /gym_plans.json
  def index
    @gym_plans = GymPlan.all
  end

  # GET /gym_plans/1 or /gym_plans/1.json
  def show
    @gym_plan = GymPlan.find(params[:id])
    @exercise = @gym_plan.exercises
  end

  # GET /gym_plans/new
  def new
    @gym_plan = GymPlan.new
  end

  # GET /gym_plans/1/edit
  def edit
  end

  # POST /gym_plans or /gym_plans.json
  def create
    @gym_plan = GymPlan.new(gym_plan_params)

    respond_to do |format|
      if @gym_plan.save
        format.html { redirect_to gym_plan_url(@gym_plan), notice: "Gym plan was successfully created." }
        format.json { render :show, status: :created, location: @gym_plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gym_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gym_plans/1 or /gym_plans/1.json
  def update
    respond_to do |format|
      if @gym_plan.update(gym_plan_params)
        format.html { redirect_to gym_plan_url(@gym_plan), notice: "Gym plan was successfully updated." }
        format.json { render :show, status: :ok, location: @gym_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gym_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gym_plans/1 or /gym_plans/1.json
  def destroy
    @gym_plan.destroy

    respond_to do |format|
      format.html { redirect_to gym_plans_url, notice: "Gym plan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gym_plan
      @gym_plan = GymPlan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gym_plan_params
      params.require(:gym_plan).permit(:name, :number_of_days)
    end

  def correct_user
    @gym_plan = current_user.gym_plans.find_by(id: params[:id])
    end
end
