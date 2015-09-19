class GroupsController < ApplicationController
  def create
    @group = current_user.owned_groups.build(group_params)
    if @group.save
      flash[:success] = "Group created!"
      redirect_to user_path(current_user)
    else
      flash[:danger] = "Group creation failed!"
      redirect_to request.referrer || group_path
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:success] = "Group Destroyed"
    redirect_to request.referrer || group_path
  end

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
