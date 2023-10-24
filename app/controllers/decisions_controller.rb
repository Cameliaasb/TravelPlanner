class DecisionsController < ApplicationController
  def create
    # for expert users only, handled through view
    @decision = Decision.new(decision_params)
    @decision.campaign = Campaign.find(params[:campaign_id])
    @decision.expert = current_user if expert?
    @campaign = @decision.campaign
    if @decision.save
      redirect_to @decision.campaign, notice: "Post added to feed"
    else
      redirect_to @campaign, alert: "Something went wrong, make sure you have entered a title and description"
    end
  end

  def update
    # for expert users only, handled through view
    @decision = Decision.find(params[:id])
    @decision.update(decision_params)
    @campaign = @decision.campaign
    if @decision.save
      redirect_to @campaign, notice: "Decision updated"
    else
      redirect_to @campaign, alert: "Title or description cannot be blank"
    end
  end

  def destroy
    ## Link is in campaigns#show, giving access to experts only
    @decision = Decision.find(params[:id])
    @campaign = @decision.campaign
    @decision.destroy
    redirect_to campaign_path(@campaign), status: :see_other
  end

  private

  def expert?
    current_user.instance_of?(Expert)
  end

  def decision_params
    params.require(:decision).permit(:title, :content)
  end
end
