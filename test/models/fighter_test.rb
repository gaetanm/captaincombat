require "test_helper"

class FighterTest < ActiveSupport::TestCase
  # Instance methods

  test "#stuff_weight" do
    fighter = fighters(:guts)
    assert_equal 50, fighter.stuff_weight

    fighter.weapon_id = nil
    fighter.shield_id = nil
    assert_equal 0, fighter.stuff_weight
  end

  # Validations

  test "total stuff weight cannot exceed the max authorized" do
    fighter = fighters(:guts)
    fighter.weapon = weapons(:moon_sword)
    fighter.shield = shields(:berserk_shield)
    refute fighter.valid?

    fighter.weapon = weapons(:berserk_axe)
    assert fighter.valid?
  end

  test "total points used for each stat cannot exceed the max authorized" do
    Fighter.stub_const(:MAX_TOTAL_STAT_POINTS, 100) do
      fighter = Fighter.new(name: "Legolas", attack: 100, health: 100)
      refute fighter.valid?
      assert_includes fighter.errors.full_messages, "Total points for stats can't exceed 100"

      fighter.attack = 80
      fighter.health = 20
      assert fighter.valid?
    end
  end

  test "health value should be between 1 and the max of total stat points authorized" do
    fighter = Fighter.new(health: 0, attack: 50, name: 'Frodo')
    refute fighter.valid?
    fighter.health = 101
    refute fighter.valid?

    fighter.health = 2
    assert fighter.valid?
  end

  test "attack value should be between 1 and the max of total stat points authorized" do
    fighter = Fighter.new(attack: 0, health: 50, name: 'Frodo')
    refute fighter.valid?
    fighter.attack = 101
    refute fighter.valid?

    fighter.attack = 2
    assert fighter.valid?
  end

  test "name is mandatory" do
    fighter = Fighter.new(attack: 50, health: 50, name: nil)
    refute fighter.valid?
  end

  test "name should not exceed 32 characters" do
    fighter = Fighter.new(attack: 50, health: 50, name: "x" * 50)
    refute fighter.valid?
  end
end