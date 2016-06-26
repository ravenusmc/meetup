class CommentsController < ApplicationController

  def new 
    @comment = Comment.new(group: @group)
  end 

  def create
    @groups = Group.all
    @comment = Comment.new(comment_params)
    if @comment.save 
      redirect_to @group 
    else 
      render 'new'
    end 
  end 

  def edit 
  end

  def update
  end 

  private 

    def comment_params 
      params.require(:comment).permit(:author, :comment, :user_id, :group_id)
    end 

end
