# As a user
# so that I can edit existing bookmark
# I want to have an update function
feature 'Updates bookmark' do
  scenario 'update button opens update bookmark form' do
    bookmark = Bookmark.create("Makers", "http://www.makers_academy.com")
    visit '/bookmarks'
    click_button 'update'
    expect(page).to have_content("Update your bookmark")
  end

  scenario 'update bookmark and see it updated' do
    bookmark = Bookmark.create("Makers", "http://www.makers_academy.com")
    visit '/bookmarks'
    click_button 'update'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'url', with: 'http://www.makersacademy.com'
    click_button('update')
    expect(page).to have_content('Makers Academy')
    expect(page).to have_content('My super unique Bookmarks Header')
  end
end