class CreateTurns < ActiveRecord::Migration[5.2]
  def change
    create_table :turns do |t|
      t.references :fight, foreign_key: true
      t.references :initiator, index: true, foreign_key: { to_table: :fighters }
      t.references :target, index: true, foreign_key: { to_table: :fighters }
      t.integer :action
      t.integer :initiator_final_health
      t.integer :target_final_health
      t.integer :initiator_inflicted_damage
      t.integer :target_inflicted_damage
      t.string :initiator_weapon_used
      t.string :target_weapon_used
      t.string :initiator_shield_used
      t.string :target_shield_used

      t.timestamps
    end
  end
end
