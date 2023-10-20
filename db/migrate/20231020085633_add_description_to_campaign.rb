class AddDescriptionToCampaign < ActiveRecord::Migration[7.0]
  def change
    add_column :campaigns, :description, :string
  end
end
