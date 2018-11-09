class FightService
  def self.call(fighter_one, fighter_two)
    new(fighter_one, fighter_two).call
  end

  def initialize(fighter_one, fighter_two)
    @fighter_one = fighter_one
    @fighter_two = fighter_two
    @fight = Fight.new
  end

  def call
    while @fighter_one.alive? && @fighter_two.alive?
      fighters  = assign_role_to_fighters
      target    = fighters[:target]
      initiator = fighters[:initiator]
      critical_attack = [true, false, false].sample

      build_turn initiator, target, critical_attack
      target.receive_attack(damage: initiator.total_attack, critical: critical_attack)
    end

    @fight.winner = [@fighter_one, @fighter_two].find(&:alive?)
    @fight.loser = [@fighter_one, @fighter_two].find(&:dead?)
    @fight
  end

  private

  def assign_role_to_fighters
    roles = {}
    roles[:initiator] = [@fighter_one, @fighter_two].sample
    roles[:target] = @fighter_one == roles[:initiator] ? @fighter_two : @fighter_one
    roles
  end

  def build_turn(initiator, target, critical_attack)
    @fight.turns.build(
        initiator: initiator,
        target: target,
        action: Turn.actions[:attack],
        initiator_weapon_used: initiator.weapon&.name,
        target_shield_used: target.shield&.name,
        initiator_total_attack: initiator.total_attack,
        target_total_defense: target.total_defense,
        target_health_before_attack: target.health,
        critical_attack: critical_attack)
  end
end