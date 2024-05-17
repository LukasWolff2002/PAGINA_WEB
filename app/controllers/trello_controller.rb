class TrelloController < ApplicationController
    def index
        @teams = WorkTeam.all
    end

end
