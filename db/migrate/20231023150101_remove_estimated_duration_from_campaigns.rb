class RemoveEstimatedDurationFromCampaigns < ActiveRecord::Migration[7.0]
  def change
    remove_column :campaigns, :estimated_duration, :integer
  end
end
