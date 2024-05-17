class UserController < ApplicationController
    def show
        @user = User.find(params[:id])
        @work_teams = @user.work_teams
    end
end