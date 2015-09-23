class ParticipationsController < ApplicationController
  def create
    @participation = Participation.new(participation_params)
    if @participation.save
      flash[:success] = "Joined the event!"
    else
      flash[:success] = "Something went wrong!"
    end
    redirect_to user_path(current_user)
  end

  def destroy
    @participation = Participation.find(params[:id])
    @participation.destroy
    redirect_to user_path(current_user)
  end

  private
  def participation_params
    params.permit(:event_id, :user_id)
  end
end
