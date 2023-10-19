class TagsController < ApplicationController
  def create
    ## New is in campaigns#index, giving access to campaign owner only
    @tag = Tag.new(tag_params)
    @tag.campaign = Campaign.find(params(:id))
    @tag.user = current_user
  end

  def destroy
    ## Link is in campaigns#show, giving access to campaign owner only
    @tag = Tag.find(params(:tag_id))
    @campaign.destroy
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end
end
