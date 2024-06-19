class TasksController < ApplicationController
  before_action :find_task, only: [:show, :destroy, :edit, :update]

  def index
    @tasks = Task.where(creator: current_user, assignee: nil, assigner: nil).or(Task.where(assignee: current_user))
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params.merge(creator: current_user))

    if task.save
      redirect_to task, notice: 'Task created'
    else
      redirect_to new_task_path, alert: task.errors.full_messages.join('; ')
    end
  end

  def show
  end

  def destroy
    @task.destroy!
    redirect_to tasks_path
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task updated'
    else
      render :edit, alert: @task.errors.full_messages.join('; ')
    end
  end

  def assigned
    @tasks = current_user.assigned_tasks
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status, :creator_id, :assignee_id, :assigner_id)
  end
end
