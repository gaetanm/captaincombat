require "application_system_test_case"

class StaticPagesTest < ApplicationSystemTestCase
  test "visiting the index" do
    first_fight = fights(:guts_vs_aragorn)
    first_fight.created_at = 1.day.ago
    last_fight  = fights(:guts_vs_artorias)
    last_fight.created_at = Time.now

    visit root_path
    assert_text "Guts versus Artorias"
  end
end
