class AddDataToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :type, :string, default: "Novice"
    add_column :users, :username, :string, null: false
    add_column :users, :status, :string, null: false
    add_column :users, :profession, :string
    add_column :users, :service, :string
  end
end
