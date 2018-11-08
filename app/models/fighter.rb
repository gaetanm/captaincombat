class Fighter < ApplicationRecord
  MAX_TOTAL_STAT_POINTS = 100
  MAX_STUFF_WEIGHT = 50

  belongs_to :weapon, class_name: "Stuff", optional: true, foreign_key: "weapon_id"
  belongs_to :shield, class_name: "Stuff", optional: true, foreign_key: "shield_id"

  validates :name, length: { maximum: 32 }, presence: true
  validates :attack, :health, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: MAX_TOTAL_STAT_POINTS }

  validate :total_stats_number_cannot_exceed_the_max_authorized, unless: -> { attack.blank? || health.blank? }
  validate :total_stuff_weight_cannot_exceed_the_max_authorized, if: -> { weapon.present? || shield.present? }

  def stuff_weight
    (weapon&.weight || 0) + (shield&.weight || 0)
  end

  private

  def total_stats_number_cannot_exceed_the_max_authorized
    if (health + attack) > MAX_TOTAL_STAT_POINTS
      errors.add(:base, "Total points for stats can't exceed #{MAX_TOTAL_STAT_POINTS}")
    end
  end

  def total_stuff_weight_cannot_exceed_the_max_authorized
    if stuff_weight > MAX_STUFF_WEIGHT
      errors.add(:base, "Stuff total weight can't exceed #{MAX_STUFF_WEIGHT}")
    end
  end
end
