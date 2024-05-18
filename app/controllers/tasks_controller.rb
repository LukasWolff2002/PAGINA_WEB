class TasksController < ApplicationController
    def show
      @task = Task.find(params[:id])
    end
  
    def new
      @board = Board.find(params[:board_id])
      @task = @board.tasks.build
      @users = @board.work_team.users
    end
  
    def create
      @board = Board.find(params[:board_id])
      @task = @board.tasks.build(task_params)
      
      if @task.save
        redirect_to @board, notice: 'Task was successfully created.'
      else
        @users = @board.work_team.users  # Asegúrate de cargar los usuarios nuevamente en caso de error
        render :new
      end
    end

    def move
      @task = Task.find(params[:id])
      if @task.update(status: params[:status])
        redirect_to @task, notice: 'Task status was successfully updated.'
      else
        redirect_to @task, alert: 'Failed to update task status.'
      end
    end
  
    private
  
    def task_params
      params.require(:task).permit(:title, :description, :status, :priority, :creator_id, :assignee_id)
    end
  end
  