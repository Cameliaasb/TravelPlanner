class TagsController < ApplicationController

  def create
    @tag = Tag.new(tag_params)
    @tag.campaign = Campaign.find(params(:id))
    @tag.user = current_user
  end

  def destroy
    @tag = Tag.find(params(:tag_id))
    @campaign.destroy
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end
end
