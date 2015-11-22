class MembershipsController < ApplicationController
  def new
    @membership = Membership.new
    @groups = Group.all
    @users = User.all
    render :new
  end

  def create
    membership_params = params.require(:membership).permit(:user_id, :group_id)
    @membership = Membership.create(membership_params)
    @groups = Group.all
   
  end
end
