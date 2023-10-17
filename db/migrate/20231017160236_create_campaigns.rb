class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.string :title, null: false
      t.float  :estimated_duration, null: false
      t.timestamps
    end
  end
end
