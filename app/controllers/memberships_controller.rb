class MembershipsController < ApplicationController

  def create
    @trip = Campaign.find(params[:campaign_id])
    @membership = Membership.new(trip: @trip, member: current_user)
    if @membership.save
      redirect_to campaign_url(@trip)
    else
      redirect_to campaign_url(@trip), notice: "Something went wrong, try again"
    end
  end

  def accept
    # next to do: give only access if membership is accepted. For now request is enough
  end

  def destroy
    @trip = Campaign.find(params[:campaign_id])
    @membership = Membership.find_by(trip: @trip, member: current_user)
    @membership.destroy
    redirect_to campaigns_path, status: :see_other
  end
end
