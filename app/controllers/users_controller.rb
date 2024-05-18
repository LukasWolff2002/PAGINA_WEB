class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
        @work_teams = @user.work_teams
    end

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        
        if @user.save
            redirect_to users_path, notice: 'Task was successfully created.'
        else
            render :new
        end
    end

    private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :position, :email, :password)
    end
end