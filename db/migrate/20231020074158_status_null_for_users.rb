class StatusNullForUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :status, :string, null: true
  end
end
