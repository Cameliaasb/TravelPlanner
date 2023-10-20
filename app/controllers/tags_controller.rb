class TagsController < ApplicationController
  def create
    ## New is in campaigns#index, giving access to campaign owner only
    @tag = Tag.new(tag_params)
    @tag.expert = current_user
    @campaign = @tag.campaign if expert?

    if @tag.save
      redirect_to @tag.campaign, notice: "Tag created"
    else
      redirect_to @campaign, alert: "Something went wrong, try again"
    end
  end

  def destroy
    ## Link is in campaigns#show, giving access to campaign owner only
    @tag = Tag.find(params[:id])
    @campaign = @tag.campaign
    @tag.destroy
    redirect_to campaign_path(@campaign), status: :see_other
  end

  private

  def expert?
    current_user.instance_of?(Expert)
  end

  def tag_params
    params.require(:tag).permit(:title, :campaign_id)
  end
end
