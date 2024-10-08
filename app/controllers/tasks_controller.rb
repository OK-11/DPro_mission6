class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update destroy ]

  def index
    current_user
    @tasks = @current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    current_user
    @task = Task.new(task_params)
    if @task.save
      @current_user.tasks << @task
      redirect_to tasks_path, notice: t('.created')
    else
      render :new
    end
  end

  def show
    current_user
    @task = @current_user.tasks.find(params[:id])
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: t('.updated')
    else
      render :edit
    end
  end

  def destroy
    current_user
    @user_task = @current_user.tasks.find_by(id: @task.id)
    @current_user.tasks.destroy(@user_task)
    @task.destroy
    redirect_to tasks_path, notice: t('.destroyed')
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :content)
    end
end
