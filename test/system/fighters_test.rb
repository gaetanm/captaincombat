require "application_system_test_case"

class FightersTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit fighters_url
    assert_text "Frodo"
    assert_text "Gandalf"
  end

  test "showing a Fighter" do
    visit fighters_url
    click_on "Show", match: :first

    assert_text "Aragorn"
    assert_text "Guts versus Aragorn"
  end

  test "creating a Fighter" do
    visit fighters_url
    click_on "New Fighter"

    fill_in "Attack", with: 50
    fill_in "Defense", with: 50
    fill_in "Name", with: "Frodo"
    select "Bastard Sword", from: "fighter[weapon_id]"
    select "Wooden Shield", from: "fighter[shield_id]"
    attach_file("fighter[avatar]", Rails.root + "test/fixtures/files/guts.jpg")

    click_on "Create Fighter"

    assert_text "Fighter was successfully created"
  end

  test "creating a Fighter with bad data" do
    visit fighters_url
    click_on "New Fighter"

    fill_in "Attack", with: ""
    fill_in "Defense", with: ""
    fill_in "Name", with: ""
    select "Berserk Axe", from: "fighter[weapon_id]"
    select "Berserk Shield", from: "fighter[shield_id]"
    click_on "Create Fighter"

    assert_text "prohibited this fighter from being saved"
  end

  test "updating a Fighter" do
    visit fighters_url
    click_on "Edit", match: :first

    fill_in "Name", with: "Sauron"
    select "Bastard Sword", from: "fighter[weapon_id]"
    select "Wooden Shield", from: "fighter[shield_id]"
    click_on "Update Fighter"

    assert_text "Fighter was successfully updated"
    click_on "Back"
  end

  test "updating a Fighter with bad data" do
    visit fighters_url
    click_on "Edit", match: :first

    fill_in "Attack", with: ""
    fill_in "Defense", with: ""
    fill_in "Name", with: ""
    click_on "Update Fighter"

    assert_text "prohibited this fighter from being saved"
  end

  test "destroying a Fighter" do
    visit fighters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fighter was successfully destroyed"
  end
end
