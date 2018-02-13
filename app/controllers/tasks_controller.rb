class TasksController < ApplicationController
    
    def index
        @tasks = task.all
    end

  def show
      @task = Task.find(params[:id])
  end

  def new
      @task = Task.new
  end

  def create
 @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'Task が正常に保存されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task が保存されませんでした'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
@task = Task.find(params[:id])

    if @task.update(message_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end

  def destroy
@task = Task.find(params[:id])
    @task.destroy
    flash[:success] = 'Task は正常に削除されました'
    redirect_to messages_url
  end
  
  
end
