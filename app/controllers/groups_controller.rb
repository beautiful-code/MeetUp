class GroupsController < ApplicationController
  before_action :authenticate_user!
  def create
    @group = current_user.owned_groups.build(group_params)
    if @group.save
      flash[:success] = "Group created!"
    else
      flash[:danger] = "Group creation failed!"
    end
    respond_to do |format|
      format.html { redirect_to request.referrer || user_path(current_user) } 
      format.js
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
