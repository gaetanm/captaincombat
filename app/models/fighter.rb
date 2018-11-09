class Fighter < ApplicationRecord
  MAX_TOTAL_STAT_POINTS = 100
  MAX_STUFF_WEIGHT = 50

  belongs_to :weapon, class_name: "Stuff", optional: true
  belongs_to :shield, class_name: "Stuff", optional: true

  has_many :fights
  has_many :turns

  validates :name, length: { maximum: 32 }, presence: true
  validates :attack, :defense, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: MAX_TOTAL_STAT_POINTS }

  validate :total_stats_number_cannot_exceed_the_max_authorized, unless: -> { attack.blank? || defense.blank? }
  validate :stuff_total_weight_cannot_exceed_the_max_authorized, if: -> { weapon.present? || shield.present? }

  before_save :set_health

  def alive?
    health > 0
  end

  def stuff_weight
    (weapon&.weight || 0) + (shield&.weight || 0)
  end

  def total_defense
    defense + stuff_total_defense
  end

  def total_attack
    attack + stuff_total_attack
  end

  private

  def set_health
    self.health = 100
  end

  def stuff_total_defense
    (weapon&.defense || 0) + (shield&.defense || 0)
  end

  def stuff_total_attack
    (weapon&.attack || 0 ) + (shield&.attack || 0)
  end

  def total_stats_number_cannot_exceed_the_max_authorized
    if (defense + attack) > MAX_TOTAL_STAT_POINTS
      errors.add(:base, "Total points for stats can't exceed #{MAX_TOTAL_STAT_POINTS}")
    end
  end

  def stuff_total_weight_cannot_exceed_the_max_authorized
    if stuff_weight > MAX_STUFF_WEIGHT
      errors.add(:base, "Stuff total weight can't exceed #{MAX_STUFF_WEIGHT}")
    end
  end
end
