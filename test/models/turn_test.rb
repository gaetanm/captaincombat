require 'test_helper'

class TurnTest < ActiveSupport::TestCase
  test "#damage_given" do
    turn = turns(:guts_as_initiator)
    turn.initiator_total_attack = 20
    turn.target_total_defense = 10

    assert_equal 10, turn.damage_given

    turn.initiator_total_attack = 5
    assert_equal 0, turn.damage_given
  end

  test "#target_health_after_attack" do
    turn = turns(:guts_as_initiator)
    turn.target_health_before_attack = 50
    turn.initiator_total_attack = 10

    assert_equal 40, turn.target_health_after_attack
  end
end
