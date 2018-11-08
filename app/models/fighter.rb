class Fighter < ApplicationRecord
  MAX_TOTAL_STAT_POINTS = 100

  belongs_to :weapon, class_name: "Stuff", optional: true, foreign_key: "weapon_id"
  belongs_to :shield, class_name: "Stuff", optional: true, foreign_key: "shield_id"

  validates :name, length: { maximum: 32 }, presence: true
  validates :attack, :health, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: MAX_TOTAL_STAT_POINTS }

  validate :total_stats_number_cannot_exceed_the_max_authorized


  private

  def total_stats_number_cannot_exceed_the_max_authorized
    if (health + attack) > MAX_TOTAL_STAT_POINTS
      errors.add(:base, "Total points for stats can't exceed #{MAX_TOTAL_STAT_POINTS}")
    end
  end
end
