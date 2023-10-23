class AddStartDateToCampaign < ActiveRecord::Migration[7.0]
  def change
    add_column :campaigns, :start_date, :date
    add_column :campaigns, :end_date, :date
    add_column :campaigns, :total_price, :float
    change_column :campaigns, :estimated_duration, :integer
  end
end
