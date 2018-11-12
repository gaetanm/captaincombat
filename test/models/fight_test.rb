require 'test_helper'

class FightTest < ActiveSupport::TestCase
  test "#vs_title" do
    fight = fights(:guts_vs_aragorn)
    assert_equal "Guts versus Aragorn", fight.vs_title
  end

  test "#winner_name" do
    fight = fights(:guts_vs_aragorn)
    fight.winner = nil

    assert_equal "Deleted Fighter", fight.winner_name
  end

  test "#loser_name" do
    fight = fights(:guts_vs_aragorn)
    fight.loser = nil

    assert_equal "Deleted Fighter", fight.loser_name
  end
end
