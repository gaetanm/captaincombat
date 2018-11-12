module FightsHelper
  def fight_sequence(fight)
    sequence = ""
    fight.turns.each { |turn| sequence += describe_turn(turn) }
    sequence.html_safe
  end

  private

  def describe_turn(turn)
    description = if turn.critical_attack?
      describe_turn_with_critical_attack(turn)
    else
      describe_turn_with_normal_attack(turn)
    end
    description + " #{turn.target_name}'s health is now #{turn.target_health_after_attack}.<br /><br />"
  end

  # OPTIMIZE: Use locales...
  def describe_turn_with_critical_attack(turn)
    action_description = ""
    action_description += if turn.initiator_weapon_used
      "#{turn.initiator_name} #{Turn.actions.key(turn.action)}s #{turn.target_name} with his #{turn.initiator_weapon_used} for a total CRITICAL attack of #{turn.initiator_total_attack}.<br />"
    else
      "#{turn.initiator_name} #{Turn.actions.key(turn.action)}s #{turn.target_name} for a total CRITICAL attack of #{turn.initiator_total_attack}.<br />"
    end
    action_description += "#{turn.target_name} takes #{turn.damage_given} because the attack was critical."
  end

  def describe_turn_with_normal_attack(turn)
    action_description = ""
    action_description += if turn.initiator_weapon_used
      "#{turn.initiator_name} #{Turn.actions.key(turn.action)}s #{turn.target_name} with his #{turn.initiator_weapon_used} for a total attack of #{turn.initiator_total_attack}.<br />"
    else
      "#{turn.initiator_name} #{Turn.actions.key(turn.action)}s #{turn.target_name} for a total attack of #{turn.initiator_total_attack}.<br />"
    end
    action_description += if turn.target_shield_used
      "#{turn.target_name} defends himself with his #{turn.target_shield_used} for a total defense of #{turn.target_total_defense}. He takes #{turn.damage_given} damage."
    else
      "#{turn.target_name} defends himself for a total defense of #{turn.target_total_defense}. He takes #{turn.damage_given} damage."
    end
  end
end