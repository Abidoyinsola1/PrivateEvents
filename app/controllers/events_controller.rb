class EventsController < ApplicationController
    before_action :CheckUser
    def new
        @event = Event.new
    end

    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def create
        user = User.find(session[:user_id])
        @event = user.events.new(params_event)
        if @event.save
            flash[:notice] = "You have successfully created an event!"
            redirect_to events_path
        else
            flash[:alert] = "Oops, there's an error creating your event!"
            render 'new'
    end
    end


    private

    def params_event
        params.require(:event).permit(:name, :description, :location, :date)
    end
end
