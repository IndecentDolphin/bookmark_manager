feature 'Deleting Bookmarks' do
  scenario 'User deletes a bookmark' do
    bookmark = Bookmark.create("Makers", "http://www.makers_academy.com")
    visit '/bookmarks'
    click_button 'delete'
    expect(page).to have_content("My super unique Bookmarks Header")
    expect(page).not_to have_content(bookmark)
  end
end