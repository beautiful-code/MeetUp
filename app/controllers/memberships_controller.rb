class MembershipsController < ApplicationController
  def create
    @membership = Membership.new(membership_params)
    if @membership.save
      flash[:success] = "Joined the group!"
    else
      flash[:success] = "Something went wrong!"
    end
    redirect_to user_path(current_user)
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy
    redirect_to user_path(current_user)
  end

  private
  def membership_params
    params.permit(:group_id, :member_id)
  end

end
