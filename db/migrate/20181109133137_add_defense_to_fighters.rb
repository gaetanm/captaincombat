class AddDefenseToFighters < ActiveRecord::Migration[5.2]
  def change
    add_column :fighters, :defense, :integer, default: 0
  end
end
