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

    assert_text "Name: Aragorn"
  end

  test "creating a Fighter" do
    visit fighters_url
    click_on "New Fighter"

    fill_in "Attack", with: 50
    fill_in "Health", with: 50
    fill_in "Name", with: "Frodo"
    click_on "Create Fighter"

    assert_text "Fighter was successfully created"
  end

  test "creating a Fighter with bad data" do
    visit fighters_url
    click_on "New Fighter"

    fill_in "Attack", with: 0
    fill_in "Health", with: 0
    fill_in "Name", with: ""
    click_on "Create Fighter"

    assert_text "prohibited this fighter from being saved"
  end

  test "updating a Fighter" do
    visit fighters_url
    click_on "Edit", match: :first

    fill_in "Name", with: "Sauron"
    click_on "Update Fighter"

    assert_text "Fighter was successfully updated"
    click_on "Back"
  end

  test "updating a Fighter with bad data" do
    visit fighters_url
    click_on "Edit", match: :first

    fill_in "Attack", with: 0
    fill_in "Health", with: 0
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
