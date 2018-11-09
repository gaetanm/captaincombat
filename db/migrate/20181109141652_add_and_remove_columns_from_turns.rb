class AddAndRemoveColumnsFromTurns < ActiveRecord::Migration[5.2]
  def change
    remove_column :turns, :initiator_final_health, :integer
    remove_column :turns, :target_final_health, :integer
    remove_column :turns, :initiator_inflicted_damage, :integer
    remove_column :turns, :target_inflicted_damage, :integer
    remove_column :turns, :target_weapon_used, :integer
    remove_column :turns, :initiator_shield_used, :integer

    add_column :turns, :initiator_total_attack, :integer
    add_column :turns, :target_total_defense, :integer
    add_column :turns, :target_health_before_attack, :integer
    add_column :turns, :critical_attack, :boolean, default: false
  end
end