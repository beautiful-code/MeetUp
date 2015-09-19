class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if current_user == @user
      @group_memberships = @user.mygroups
      @newgroup = @user.owned_groups.build
    else
      redirect_to current_user
    end
  end
end
