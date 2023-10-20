class AddExpertToDecisions < ActiveRecord::Migration[7.0]
  def change
    add_reference :decisions, :expert
  end
end
