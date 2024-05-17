class BoardController < ApplicationController

    def show
        @board = Board.find(params[:id])
        @tasks = @board.tasks
    end

end