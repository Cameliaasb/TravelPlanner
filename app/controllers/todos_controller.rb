class TodosController < ApplicationController
  def create
    ## New is in campaigns#index, all users can create todos
    @todo = Todo.new(todo_params)
    @todo.user = current_user

    if @todo.save
      redirect_to @todo.campaign, notice: "New task created"
    else
      redirect_to @todo.campaign, alert: "Something went wrong, try again"
    end
  end

  def destroy

    ## Link is in campaigns#show, giving access to campaign owner only
    @todo = Todo.find(params[:todo_id])
    @todo.destroy
    redirect_to campaign_path(@todo.campaign)
  end

  private

  def todo_params
    params.require(:todo).permit(:content, :campaign_id)
  end
end
