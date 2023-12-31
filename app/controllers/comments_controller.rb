class CommentsController < ApplicationController
  def create
    ## New is in campaigns#index
    @comment = Comment.new(comment_params)
    @todo = Todo.find(params[:todo_id])
    @comment.todo = @todo
    @comment.user = current_user

    @campaign = @comment.todo.campaign

    if @comment.save
      TodoChannel.broadcast_to(
        @todo,
        render_to_string(partial: "comments/comment", locals: { comment: @comment })
      )
      head :ok
    else
      redirect_to @campaign, alert: "Something went wrong, try again"
    end
  end

  def destroy
    ## Link is in campaigns#show, giving access to campaign owner only
    @comment = Comment.find(params[:id])
    @campaign = @comment.todo.campaign
    @comment.destroy
    redirect_to campaign_path(@campaign), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:title)
  end
end
