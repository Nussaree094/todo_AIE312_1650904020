class TasksController < ApplicationController
    before_action :set_task, only: [:complete]
  
    def index
      @tasks = Task.where(status: false)
      @new_task = Task.new
    end
  
    def create
      @task = Task.new(task_params)
      @task.status = false  # Default to "incomplete" status
  
      if @task.save
        redirect_to tasks_path, notice: 'Task was successfully created.'
      else
        render :index
      end
    end
  
    def complete
      @task.update(status: true)
      redirect_to tasks_path, notice: 'Task marked as complete.'
    end
  
    private
  
    def set_task
      @task = Task.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:title)
    end
  end
  