feature 'Adding bookmarks' do
    scenario 'User can see Add bookmark link ' do 
        visit '/'
        find_link('Add Bookmark')
    end
    scenario 'User can access \'add bookmark\' page' do
        visit '/'
        click_link 'Add Bookmark'
        expect(page).to have_content("Add a new bookmark")
    end
end