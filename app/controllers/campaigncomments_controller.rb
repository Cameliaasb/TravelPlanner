class CampaigncommentsController < ApplicationController
  def create
    @comment = Campaigncomment.new(campaigncomment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @comment.campaign, notice: "Comment created"
    else
      redirect_to @comment.campaign, alert: "Something went wrong, try again"
    end
  end

  def destroy
    @comment = Campaigncomment.find(params[:id])
    @campaign = @comment.campaign
    @comment.destroy
    redirect_to campaign_path(@campaign)
  end

  private

  def campaigncomment_params
    params.require(:campaigncomment).permit(:title, :campaign_id)
  end
end
