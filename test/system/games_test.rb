require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "span", count: 10
  end
  test "fill the form with a random word, click the play button, and get a message that the word is not in the grid.
" do
    visit new_url
    fill_in("attempt", with: Array.new(10) { ('a'..'z').to_a.sample }.join)
    click_on("Play")
    page.has_content?("can't be build out of")
  end
  test "fill the form with a one-letter consonant word, click play, and get a message it’s not a valid English word"
  fill_in("attempt", with: Array.new(1) { ('a'..'z').to_a.sample }.join)
end
