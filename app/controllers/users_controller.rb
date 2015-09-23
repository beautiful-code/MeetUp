class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    if current_user == @user
      @mygroups = @user.mygroups
      @newgroup = @user.owned_groups.build
      @myevents = @user.myevents
    else
      redirect_to current_user
    end
  end
end
