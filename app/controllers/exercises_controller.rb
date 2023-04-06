class ExercisesController < ApplicationController
  before_action :set_exercise, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /exercises or /exercises.json
  def index
    @gym_plan = GymPlan.find(params[:gym_plan_id])
    @exercises = @gym_plan.exercises
  end

  # GET /exercises/1 or /exercises/1.json
  def show
    @gym_plan = GymPlan.find(params[:gym_plan_id])
    @exercise = @gym_plan.exercises.find(params[:id])
  end

  # GET /exercises/new
  def new
      @gym_plan = current_user.gym_plans.find(params[:gym_plan_id])
      @exercise = @gym_plan.exercises.new
  end

  # GET /exercises/1/edit
  def edit
    @gym_plan = current_user.gym_plans.find(params[:gym_plan_id])
    @exercise = @gym_plan.exercises.find(params[:id])
  end

  # POST /exercises or /exercises.json
  def create
    @gym_plan = current_user.gym_plans.find(params[:gym_plan_id])
    @exercise = @gym_plan.exercises.new(exercise_params)

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to gym_plan_exercises_url, notice: "Exercise was successfully created." }
        format.json { render :show, status: :created, location: @exercise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercises/1 or /exercises/1.json
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to gym_plan_exercises_url(@exercise), notice: "Exercise was successfully updated." }
        format.json { render :show, status: :ok, location: @exercise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1 or /exercises/1.json
  def destroy
    @gym_plan = current_user.gym_plans.find(params[:gym_plan_id])
    @exercise = @gym_plan.exercises.find(params[:id])

    respond_to do |format|
      if  @exercise.destroy
        format.html { redirect_to gym_plan_exercises_url, notice: "Exercise was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercise_params
      params.require(:exercise).permit(:name, :number_of_series, :number_of_reps)
    end
end
