class CampaignsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Only logged users can see the index because they only have access to trips where they are members
    @campaigns  = current_user.trips
    @campaign   = Campaign.new
  end

  def show
    # Only logged users can see the details (handled by Devise before_action)
    @campaign = Campaign.find(params[:id])

    @campaigncomment = Campaigncomment.new
    @todo = Todo.new
    @comment = Comment.new
    @decision = Decision.new

    # Used in view to give access to owner only for : edit campaign / add or delete tag
    @owner = owner?(@campaign)
    @tag = Tag.new

    # Used in view to give access to experts only for : create, edit or delete decisions
    @expert = expert?
  end

  def create
    @campaign = Campaign.new(campaign_params)
    # Only expert users can create a new campaign
    @campaign.expert = current_user if expert?
    if @campaign.save
      owner_is_member(@campaign, @campaign.expert)
      upgrade_status(@campaign.expert)
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

  def upgrade_status(user)
    experience = user.campaigns.count
    if experience > 10
      # highest rank : guru
      user.status = Expert::STATUS[2]
    elsif experience > 5
      # master
      user.status = Expert::STATUS[1]
    else
      user.status = Expert::STATUS[0]
    end
  end

  def owner_is_member(campaign, user)
    Membership.create(trip: campaign, member: user)
  end

  def expert?
    current_user.instance_of?(Expert)
  end

  def owner?(campaign)
    current_user == campaign.expert
  end

  def campaign_params
    params.require(:campaign).permit(:title, :estimated_duration, :start_date, :end_date, :description)
  end
end
