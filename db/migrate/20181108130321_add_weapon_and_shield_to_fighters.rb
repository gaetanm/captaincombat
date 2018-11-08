class AddWeaponAndShieldToFighters < ActiveRecord::Migration[5.2]
  def change
    add_reference :fighters, :weapon, foreign_key: true
    add_reference :fighters, :shield, foreign_key: true
  end
end
