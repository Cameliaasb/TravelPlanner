class TodosController < ApplicationController

  def new
    @todo = Todo.new
  end

  def show
    @todo = Todo.find(params[:id])
    @comment = Comment.new
    @owner = (current_user == @todo.campaign.expert)
  end

  def create
    ## New is linked campaigns#show, all users can create todos
    @todo = Todo.new(todo_params)
    @todo.user = current_user

    if @todo.save
      redirect_to @todo, notice: "New topic created"
    else
      redirect_to @todo.campaign, alert: "Something went wrong, make sure the topic has a title"
    end
  end

  def destroy
    ## Link is in campaigns#show, giving access to campaign owner only
    @todo = Todo.find(params[:id])
    @campaign = @todo.campaign
    @todo.destroy
    redirect_to campaign_path(@campaign), status: :see_other
  end

  private

  def todo_params
    params.require(:todo).permit(:content, :campaign_id, :description)
  end
end
