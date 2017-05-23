class TasksController < ApplicationController
  def index
    @taskall = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @tasknew = Task.new
  end

  def create
    @task_create = Task.new(task_params)
    
    if @task_create.save
      flash[:success] = 'タスク が正常に投稿されました'
      redirect_to @task_create
    else
      flash.now[:danger] = 'タスク が投稿されませんでした'
      render :new
    end
  end 

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'タスクが正常に投稿されました。'
      redirect_to task_url(@task)
    else
      flash.now[:danger] = 'タスクが投稿されませんでした。'
      render :edit
    end
  end
  
  def destroy
    @taskd = Task.find(params[:id])
    @taskd.destroy
    
    flash[:success] = 'タスクは正常に削除されました。'
    redirect_to root_path
  end
  
  
  private

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  end

end