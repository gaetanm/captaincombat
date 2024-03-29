require "test_helper"

class FighterTest < ActiveSupport::TestCase
  # Instance methods

  test "#weapon_name" do
    guts = fighters(:guts)
    guts.weapon = nil

    assert_equal "No Weapon", guts.weapon_name
  end

  test "#shield_name" do
    guts = fighters(:guts)
    guts.shield = nil

    assert_equal "No Shield", guts.shield_name
  end

  test "#gain_victory_experience" do
    guts = fighters(:guts)
    guts.experience = 10

    guts.gain_victory_experience

    assert_equal 20, guts.experience
  end

  test "#gain_defeat_experience" do
    guts = fighters(:guts)
    guts.experience = 10

    guts.gain_defeat_experience

    assert_equal 15, guts.experience
  end

  test "#win_ratio" do
    guts = fighters(:guts)
    aragorn = fighters(:aragorn)
    Fight.create(winner: aragorn, loser: guts)

    assert_equal 0.7, guts.win_ratio
    assert_equal 0.5, aragorn.win_ratio
  end

  test "#victories" do
    guts = fighters(:guts)
    aragorn = fighters(:aragorn)

    assert_equal 2, guts.victories
    assert_equal 0, aragorn.victories
  end

  test "#defeats" do
    guts = fighters(:guts)
    aragorn = fighters(:aragorn)

    assert_equal 0, guts.defeats
    assert_equal 1, aragorn.defeats
  end

  test "#receive_attack" do
    fighter = fighters(:artorias)
    fighter.health = 100
    fighter.defense = 80

    fighter.receive_attack(damage: 75, critical: false)
    assert_equal 100, fighter.health

    fighter.receive_attack(damage: 75, critical: true)
    assert_equal 25, fighter.health
  end

  test "#alive?" do
    fighter = fighters(:guts)
    fighter.health = 1
    assert fighter.alive?

    fighter.health = -1
    refute fighter.alive?
  end

  test "#total_defense" do
    fighter = fighters(:guts)
    fighter.defense = 50
    fighter.weapon.defense = 10
    fighter.shield.defense = 10

    assert_equal 70, fighter.total_defense

    fighter.weapon = nil
    fighter.shield = nil

    assert_equal 50, fighter.total_defense
  end

  test "#total_attack" do
    fighter = fighters(:guts)
    fighter.attack = 20
    fighter.weapon.attack = 10
    fighter.shield.attack = 10

    assert_equal 40, fighter.total_attack

    fighter.attack = 0
    fighter.weapon = nil
    fighter.shield = nil

    assert_equal 0, fighter.total_attack
  end

  test "#stuff_weight" do
    fighter = fighters(:guts)
    fighter.weapon.weight = 25
    fighter.shield.weight = 25
    assert_equal 50, fighter.stuff_weight

    fighter.weapon_id = nil
    fighter.shield_id = nil
    assert_equal 0, fighter.stuff_weight
  end

  # Validations

  test "stuff total weight cannot exceed the max authorized" do
    fighter = fighters(:guts)
    fighter.weapon = weapons(:moon_sword)
    fighter.shield = shields(:berserk_shield)
    refute fighter.valid?

    fighter.weapon = weapons(:berserk_axe)
    assert fighter.valid?
  end

  test "total points used for each stat cannot exceed the max authorized" do
    Fighter.stub_const(:MAX_TOTAL_STAT_POINTS, 100) do
      fighter = Fighter.new(name: "Legolas", attack: 100, defense: 100)
      refute fighter.valid?
      assert_includes fighter.errors.full_messages, "Total points for stats can't exceed 100"

      fighter.attack = 80
      fighter.defense = 20
      assert fighter.valid?
    end
  end

  test "defense value should be between 1 and the max of total stat points authorized" do
    fighter = Fighter.new(defense: 0, attack: 50, name: 'Frodo')
    refute fighter.valid?
    fighter.defense = 101
    refute fighter.valid?

    fighter.defense = 2
    assert fighter.valid?
  end

  test "attack value should be between 1 and the max of total stat points authorized" do
    fighter = Fighter.new(attack: 0, defense: 50, name: 'Frodo')
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