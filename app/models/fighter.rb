class Fighter < ApplicationRecord
  MAX_TOTAL_STAT_POINTS = 100

  validates :name, length: { maximum: 32 }, presence: true
  validates :attack, :health, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: MAX_TOTAL_STAT_POINTS }

  validate :total_stats_number_cannot_exceed_the_max_authorized

  private

  def total_stats_number_cannot_exceed_the_max_authorized
    errors.add(:base, "Total points for stats can't exceed 100") if (health + attack) > MAX_TOTAL_STAT_POINTS
  end
end
