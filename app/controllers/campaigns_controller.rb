class CampaignsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :index

  def index
    @campaigns = Campaign.all
    @campaign = Campaign.new
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.expert = current_user if current_user.instance_of?(Expert)
    if @campaign.save
      redirect_to @campaign
    else
      render 'new'
    end
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update(campaign_params)
      redirect_to @campaign, notice: "Campaign was successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    redirect_to campaigns_path
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :estimated_duration)
  end
end
