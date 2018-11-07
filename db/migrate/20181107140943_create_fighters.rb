class CreateFighters < ActiveRecord::Migration[5.2]
  def change
    create_table :fighters do |t|
      t.string :name
      t.integer :attack, default: 0
      t.integer :health, default: 0

      t.timestamps
    end
  end
end
