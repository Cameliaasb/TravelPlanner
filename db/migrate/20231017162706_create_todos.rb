class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :content, null: false
      t.boolean :done, default: false
      t.references :campaign
      t.references :user
      t.timestamps
    end
  end
end
