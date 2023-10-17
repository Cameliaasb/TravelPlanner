class CreateCampaigncomments < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigncomments do |t|
      t.string :title, null: false
      t.references :campaign, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
