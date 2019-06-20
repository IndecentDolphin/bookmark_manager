feature 'Adding bookmarks' do
    scenario 'User can see Add bookmark link ' do 
        visit '/'
        find_link('Add New Bookmark')
    end
    scenario 'User can access \'add bookmark\' page' do
        visit '/'
        click_link 'Add New Bookmark'
        expect(page).to have_content("Add a new bookmark")
    end

    scenario 'add new bookmartks link' do
        visit '/'
        click_link 'Add New Bookmark'
        fill_in 'title', with: 'John Lewis'
        fill_in 'new_bookmark_field', with: 'http://www.johnlewis.com'
        click_button('submit')
        expect(page).to have_content('John Lewis')
    end

end