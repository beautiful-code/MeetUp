class GroupsController < ApplicationController
  before_action :authenticate_user!
  def create
    @group = current_user.owned_groups.build(group_params)
    if @group.save
      redirect_to user_path(current_user)
      flash[:success] = "Group created!"
    else
      redirect_to request.referrer || group_path
      flash[:danger] = "Group creation failed!"
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:success] = "Group Destroyed"
    redirect_to request.referrer || group_path
  end

  def index
    @groups = Group.search(params[:search])
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @newgroup = Group.new
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

end
