class CommentsController < ApplicationController

  def index 
    @group = Group.find(params[:group_id])
  end

  def new 
    @group = Group.find(params[:group_id])
    @comment = @group.comments.new
  end 

  def create
    @group = Group.find(params[:group_id])
    @comment = @group.comments.new(comment_params)
    if @comment.save 
      redirect_to @group 
    else 
      render 'new'
    end 
  end 

  def edit 
    @group = Group.find(params[:group_id])
    @comment = @group.comments.find(params[:id])
  end

  def update
  end 

  def destroy
    @group = Group.find(params[:group_id])
    @comment = @group.comments.find(params[:id])
    if @comment.destroy
      flash[:success] = "Comment Destroyed"
    else 
      flash[:error] = "Comment could not be deleted"
    end 
    redirect_to @group
  end 

  private 

    def comment_params 
      params.require(:comment).permit(:author, :comment, :user_id, :group_id)
    end 

end
