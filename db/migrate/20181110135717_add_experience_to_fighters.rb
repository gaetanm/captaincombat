class AddExperienceToFighters < ActiveRecord::Migration[5.2]
  def change
    add_column :fighters, :experience, :integer, default: 0
  end
end
