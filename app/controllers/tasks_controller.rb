class TasksController < ApplicationController
  
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @taskall = Task.all.page(params[:page]).per(5)
  end

  def show

  end
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'タスク が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスク が投稿されませんでした'
      render :new
    end
  end 

  def edit

  end

  def update

    if @task.update(task_params)
      flash[:success] = 'タスクが正常に投稿されました。'
      redirect_to task_url(@task)
    else
      flash.now[:danger] = 'タスクが投稿されませんでした。'
      render :edit
    end
  end
  
  def destroy

    @task.destroy
    
    flash[:success] = 'タスクは正常に削除されました。'
    redirect_to root_path
  end
  
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
    

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end

end