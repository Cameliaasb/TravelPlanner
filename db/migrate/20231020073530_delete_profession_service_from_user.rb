class DeleteProfessionServiceFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :profession
    remove_column :users, :service
  end
end
