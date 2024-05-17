class WorkTeamController < ApplicationController

    def show
        @team = WorkTeam.find(params[:id])
        @boards = @team.boards 
        @users = @team.users
	end
end