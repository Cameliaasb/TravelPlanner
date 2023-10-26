class CampaignsController < ApplicationController
  before_action :authenticate_user!
  # before_action :user_is_member?, only: :show

  def index
    # Only logged users can see the index because they only have access to trips where they are members
    @campaigns  = current_user.trips
    @campaign   = Campaign.new
  end

  def show
    # Only logged users can see the details (handled by Devise before_action)
    @campaign = Campaign.find(params[:id])

    # ACCESS
    ## Only members can interact with the show, non-members can ask for access
    @active_membership = Membership.where(trip: @campaign, member: current_user)
    @member = @active_membership.any?
    ## Owner can : edit campaign / add or delete tag
    @owner = owner?(@campaign)
    @tag = Tag.new

    ## Experts can create, edit or delete decisions
    @expert = expert?

    # New forms
    @campaigncomment = Campaigncomment.new
    @decision = Decision.new
    @membership = Membership.new
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
      redirect_to @campaign, notice: "Your trip was successfully updated."
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

  # def user_is_member?
  #   @campaign = Campaign.find(params[:id])
  #   membership = Membership.where(trip: @campaign, member: current_user)
  #   redirect_to campaigns_path if membership.empty?
  # end

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
    params.require(:campaign).permit(:title, :start_date, :end_date, :description, :photo)
  end
end
