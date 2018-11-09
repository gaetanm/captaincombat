require "test_helper"

class FightServiceTest < ActiveSupport::TestCase
  test "#call" do
    fighter_one = fighters(:guts)
    fighter_two = fighters(:aragorn)

    fight = FightService.call(fighter_one, fighter_two)

    assert_instance_of Fight, fight
    refute_equal fight.turns.size, 0
  end
end