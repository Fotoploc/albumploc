require "application_system_test_case"

class StickersTest < ApplicationSystemTestCase
  setup do
    @sticker = stickers(:one)
  end

  test "visiting the index" do
    visit stickers_url
    assert_selector "h1", text: "Stickers"
  end

  test "should create sticker" do
    visit stickers_url
    click_on "New sticker"

    fill_in "Code", with: @sticker.code
    fill_in "Description", with: @sticker.description
    fill_in "Picture", with: @sticker.picture
    click_on "Create Sticker"

    assert_text "Sticker was successfully created"
    click_on "Back"
  end

  test "should update Sticker" do
    visit sticker_url(@sticker)
    click_on "Edit this sticker", match: :first

    fill_in "Code", with: @sticker.code
    fill_in "Description", with: @sticker.description
    fill_in "Picture", with: @sticker.picture
    click_on "Update Sticker"

    assert_text "Sticker was successfully updated"
    click_on "Back"
  end

  test "should destroy Sticker" do
    visit sticker_url(@sticker)
    click_on "Destroy this sticker", match: :first

    assert_text "Sticker was successfully destroyed"
  end
end
