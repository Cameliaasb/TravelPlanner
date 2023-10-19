class TagsController < ApplicationController
  def create
    ## New is in campaigns#index, giving access to campaign owner only
    @tag = Tag.new(tag_params)
    # @tag.campaign = Campaign.find(params(:id))
    @tag.expert = current_user

    if @tag.save
      redirect_to @tag.campaign, notice: "Tag created"
    else
      redirect_to @tag.campaign, alert: "Something went wrong, try again"
    end

  end

  def destroy
    ## Link is in campaigns#show, giving access to campaign owner only
    @tag = Tag.find(params(:tag_id))
    @campaign.destroy
  end

  private

  def tag_params
    params.require(:tag).permit(:title, :campaign_id)
  end
end
