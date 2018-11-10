require "test_helper"

class FightServiceTest < ActiveSupport::TestCase
  def setup
    @fighter_one = fighters(:guts)
    @fighter_two = fighters(:aragorn)
  end

  test "#call returns an instance of fight" do
    fight = FightService.call(@fighter_one, @fighter_two)

    assert_instance_of Fight, fight
  end

  test "#call builds fight turns" do
    fight = FightService.call(@fighter_one, @fighter_two)

    refute_equal fight.turns.size, 0
  end

  test "#call changes the fighters' experience" do
    assert_changes -> { @fighter_one.experience && @fighter_two.experience } do
      FightService.call(@fighter_one, @fighter_two)
    end
  end
end