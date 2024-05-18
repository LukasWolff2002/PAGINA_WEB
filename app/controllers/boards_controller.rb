class BoardsController < ApplicationController

    def show
      @board = Board.find(params[:id])
      @tasks = @board.tasks
    end
  
    def new
      @team = WorkTeam.find(params[:work_team_id])
      @board = @team.boards.build
    end
  
    def create
      @team = WorkTeam.find(params[:work_team_id])
      @board = @team.boards.build(board_params)
      
      if @board.save
        redirect_to @team, notice: 'Board was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def board_params
      params.require(:board).permit(:name, :description)
    end
  
  end
  