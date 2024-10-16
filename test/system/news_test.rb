require "application_system_test_case"

class NewsTest < ApplicationSystemTestCase
  setup do
    @news = news(:one)
  end

  test "visiting the index" do
    visit news_url
    assert_selector "h1", text: "News"
  end

  test "should create new" do
    visit news_url
    click_on "New new"

    fill_in "Body", with: @news.body
    fill_in "Drophead", with: @news.drophead
    fill_in "Headline", with: @news.headline
    click_on "Create New"

    assert_text "New was successfully created"
    click_on "Back"
  end

  test "should update New" do
    visit news_url(@news)
    click_on "Edit this new", match: :first

    fill_in "Body", with: @news.body
    fill_in "Drophead", with: @news.drophead
    fill_in "Headline", with: @news.headline
    click_on "Update New"

    assert_text "New was successfully updated"
    click_on "Back"
  end

  test "should destroy New" do
    visit news_url(@news)
    click_on "Destroy this new", match: :first

    assert_text "New was successfully destroyed"
  end
end
