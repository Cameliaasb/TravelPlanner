class CreateDecisions < ActiveRecord::Migration[7.0]
  def change
    create_table :decisions do |t|
      t.string :title
      t.string :content
      t.references :campaign

      t.timestamps
    end
  end
end
