RSpec.feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'A user can see bookmarks' do

    # Add the test data
    Bookmark.create('Makers', 'http://www.makersacademy.com')
    Bookmark.create('D.O.S', 'http://www.destroyallsoftware.com')
    Bookmark.create('Google', 'http://www.google.com')
    
    visit('/bookmarks')
    expect(page).to have_content "Makers"
    expect(page).to have_content "D.O.S"
    expect(page).to have_content "Google"
  end
end
