class CampaignsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :index

  def index
    # No need to be logged to see campaigns
    @campaigns  = Campaign.all
    @campaign   = Campaign.new
  end

  def show
    # Only logged users can see the details (handled by Devise before_action)
    @campaign = Campaign.find(params[:id])

    @campaigncomment = Campaigncomment.new
    @todo = Todo.new
    @comment = Comment.new

    # Used in view to give access to owner only for : edit campaign / add or delete tag
    @owner = owner?(@campaign)
    @tag = Tag.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    # Only expert users can create a new campaign
    @campaign.expert = current_user if expert?
    if @campaign.save
      redirect_to @campaign
    else
      redirect_to campaigns_path, notice: "Something went wrong, try again"
    end
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update(campaign_params)
      redirect_to @campaign, notice: "Campaign was successfully updated."
    else
      redirect_to campaign_path(@campaign), notice: "Something went wrong, try again"
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    redirect_to campaigns_path
  end

  private

  def expert?
    current_user.instance_of?(Expert)
  end

  def owner?(campaign)
    current_user == campaign.expert
  end

  def campaign_params
    params.require(:campaign).permit(:title, :estimated_duration)
  end
end
