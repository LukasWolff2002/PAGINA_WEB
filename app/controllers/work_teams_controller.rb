class WorkTeamsController < ApplicationController

    def index 
        @teams = WorkTeam.all
    end

    def show
        @team = WorkTeam.find(params[:id])
        @boards = @team.boards 
        @users = @team.users
	end

    def new
        @work_team = WorkTeam.new
    end

    def create
        @work_team = WorkTeam.new(work_team_params)
        if @work_team.save
            add_users_to_work_team
            redirect_to @work_team, notice: 'Work team was successfully created.'
        else
            render :new
        end
    end

    def add_users
        @work_team = WorkTeam.find(params[:id])
    end
    
    def update_users
        @work_team = WorkTeam.find(params[:id])
        add_users_to_work_team
        redirect_to @work_team, notice: 'Users were successfully added to the team.'
    end

    private

    def work_team_params
        params.require(:work_team).permit(:name, :description, user_emails: [])
    end

    def add_users_to_work_team
        emails = params[:work_team][:user_emails].split(',').map(&:strip).reject(&:blank?)
        emails.each do |email|
          user = User.find_by(email: email)
          @work_team.users << user if user
        end
    end
end