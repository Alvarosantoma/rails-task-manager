class TasksController < ApplicationController

  before_action :set_task, only: [:show,:edit,:update,:destroy]

  def index
    @tasks = Task.all
  end

  def show

  end

  def new
    @task = Task.new()
  end

  def create
    rest = Task.new(task_params)
    rest.save
    redirect_to "/tasks"
  end

  def edit
    @task = Task.find(params[:id]) # could I use @task only
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to "/tasks"
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to "/tasks"
  end

  private

  def task_params
      params.require(:task).permit(:content)
  end

  def set_task
    @task = Task.find(params[:id].to_i)
  end
end
