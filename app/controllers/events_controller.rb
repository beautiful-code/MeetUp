class EventsController < ApplicationController
  before_action :authenticate_user!

  def create
    @group = Group.find(params[:event][:group_id])
    @event = @group.events.build(event_params)
    @event.user_id = current_user.id

    if @event.save
      flash[:success] = "Event Created"
    else
      flash[:danger] = "Soemthing went wrong!"
    end
    redirect_to request.referrer || user_path(current_user)
  end

  def new
    @event = Event.new
    @groups = Group.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.search(params[:search])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to request.referrer || user_path(current_user)
  end

  private
  def event_params
    params.require(:event).permit(:name, :group_id, :start_at, :end_at);
  end
end

