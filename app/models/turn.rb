class Turn < ApplicationRecord
  belongs_to :fight
  belongs_to :initiator, class_name: "Fighter"
  belongs_to :target, class_name: "Fighter"

  enum actions: { attack: 0, heal: 1 }

  delegate :name, to: :initiator, prefix: true, allow_nil: true
  delegate :name, to: :target, prefix: true, allow_nil: true

  def initiator_name
    initiator&.name || "Deleted Fighter"
  end

  def target_name
    target&.name || "Deleted Fighter"
  end

  def damage_given
    if critical_attack
      initiator_total_attack
    else
      damage_received = initiator_total_attack - target_total_defense
      damage_received > 0 ? damage_received : 0
    end
  end

  def target_health_after_attack
    health = target_health_before_attack - damage_given
    health < 0 ? 0 : health
  end
end
