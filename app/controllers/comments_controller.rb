class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_commentable
  before_action :set_comment, only: [:destroy]

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to_commentable_with_notice
    else
      redirect_to_commentable_with_alert
    end
  end

  def destroy
    @comment.destroy
    redirect_to_commentable_with_notice('Comment was successfully deleted.')
  end

  private

  def set_commentable
    @commentable = find_parent_record
    redirect_to root_path, alert: 'Item not found.' unless @commentable
  end

  def set_comment
    @comment = @commentable.comments.find_by(id: params[:id], user: current_user)
    redirect_to polymorphic_path(@commentable), alert: 'You are not authorized to perform this action.' unless @comment
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def redirect_to_commentable_with_notice(notice = 'Comment was successfully created.')
    redirect_to polymorphic_path(@commentable), notice: notice
  end

  def redirect_to_commentable_with_alert(alert = 'Failed to create comment.')
    redirect_to polymorphic_path(@commentable), alert: alert
  end
end
