class CreateStuffs < ActiveRecord::Migration[5.2]
  def change
    create_table :stuffs do |t|
      t.string :name
      t.string :type, null: false
      t.integer :attack, default: 0
      t.integer :defense, default: 0
      t.integer :weight, default: 0

      t.timestamps
    end
  end
end
