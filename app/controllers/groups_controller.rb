class GroupsController < ApplicationController

  include GroupsHelper

  def index 
    @groups = Group.all
    @group_count = 0

    @nearby_groups = []

    @groups.each do |group|
      if nearby(group.longitude, group.latitude, current_user.longitude, current_user.latitude)
        @group_count += 1
        @nearby_groups.push(group)
      end 
    end 
  end

  def show
    @group = Group.find(params[:id])
  end 

  def new 
    @group = Group.new 
  end 

  def create
    @group = Group.new(group_params)
    if @group.save 
      redirect_to @group 
    else 
      render 'new'
    end
  end 

  def edit 
    @group = Group.find(params[:id])
  end 

  def update 
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      #Hanles an update
      redirect_to @group
    else 
      'edit'
    end
  end

  def destroy
    Group.find(params[:id]).destroy
    redirect_to groups_url
  end

  private

    def group_params
      params.require(:group).permit(:topic, :user_id, :description, :address, :city, :state) 
    end

end
