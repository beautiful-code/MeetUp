class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @mygroups = @user.mygroups
    @newgroup = @user.owned_groups.build
    @myevents = @user.myevents
    @mynotifications = @user.unread_notifications
  end
end
