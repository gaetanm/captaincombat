require "application_system_test_case"

class FightsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit fights_url
    assert_selector "h1", text: "Fights"
  end

  test "showing a Fight with a deleted Fighter" do
    fight = fights(:guts_vs_aragorn)
    fight.winner.delete
    visit fight_url(fight)

    assert_text "Deleted Fighter"

    fight.loser.delete
    visit fight_url(fight)

    assert_text "Deleted Fighter"
  end

  test "creating a Fight" do
    visit fights_url

    click_on "New Fight"

    select "Guts", from: "fighter_one"
    select "Artorias", from: "fighter_one"

    click_on "Create Fight"

    assert_text "The winner is "
  end

  test "destroying a Fight" do
    visit fights_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fight was successfully destroyed"
  end
end
