class TaskController < ApplicationController
  def index
    tasks = Task.order(:timestamps);
    render json: tasks;
  end

  def create
    task = Task.create(task_param);
    render json: task;
  end

  def update
    task = Task.find(params[:id]);
    task.update_attributes(task_param);
    render json: task;
  end

  def destroy
    task = Task.find(params[:id]);
    task.update_attributes(task_param);
    render json: task;
  end

  private
    def task_param
      params.require(:task).permit(:userId, :taskName, :description, :tags, :schedule, :taskType);
    end
end

