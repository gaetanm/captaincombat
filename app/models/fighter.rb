class Fighter < ApplicationRecord
  MAX_TOTAL_STAT_POINTS = 100
  MAX_STUFF_WEIGHT = 50

  belongs_to :weapon, class_name: "Stuff", optional: true
  belongs_to :shield, class_name: "Stuff", optional: true

  has_many :won_fights, class_name: "Fight", foreign_key: :winner_id, dependent: :nullify
  has_many :lost_fights, class_name: "Fight", foreign_key: :loser_id, dependent: :nullify

  delegate :name, to: :weapon, prefix: true, allow_nil: true
  delegate :name, to: :shield, prefix: true, allow_nil: true

  validates :name, length: { maximum: 32 }, presence: true
  validates :attack, :defense, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: MAX_TOTAL_STAT_POINTS }

  validate :total_stats_number_cannot_exceed_the_max_authorized, unless: -> { attack.blank? || defense.blank? }
  validate :stuff_total_weight_cannot_exceed_the_max_authorized, if: -> { weapon.present? || shield.present? }

  before_save :set_health

  def gain_victory_experience
    self.experience += 10
  end

  def gain_defeat_experience
    self.experience += 5
  end

  def win_ratio
    (victories.to_f / fights.count.to_f).round(1)
  end

  def fights
    won_fights + lost_fights
  end

  def victories
    won_fights.count
  end

  def defeats
    lost_fights.count
  end

  def receive_attack(damage:, critical:)
    if critical
      self.health -= damage
    else
      damage_received = damage - total_defense
      self.health -= damage_received if damage_received > 0
    end
  end

  def dead?
    !alive?
  end

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
