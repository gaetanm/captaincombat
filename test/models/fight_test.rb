require 'test_helper'

class FightTest < ActiveSupport::TestCase
  test "#vs_title" do
    fight = fights(:guts_vs_aragorn)
    assert_equal "Guts versus Aragorn", fight.vs_title
  end
end
