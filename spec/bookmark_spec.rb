require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      # Setup the test database becuase the script is childish
      DatabaseConnection.setup('bookmark_manager_test')

      bookmark = Bookmark.create('Makers', 'http://www.makersacademy.com')
      Bookmark.create('D.O.S', 'http://www.destroyallsoftware.com')
      Bookmark.create('Google', 'http://www.google.com')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
     end
  end
  
  describe '.create' do
     it 'adds a new bookmark' do
      # Setup the test database becuase the script is childish

      DatabaseConnection.setup('bookmark_manager_test')
      bookmark = Bookmark.create('Test Bookmark', 'http://testbookmark.com')
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://testbookmark.com'
     end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create('Makers', 'http://www.makersacademy.com')
      Bookmark.create('D.O.S', 'http://www.destroyallsoftware.com')
      Bookmark.create('Google', 'http://www.google.com')

      bookmarks = Bookmark.all

      Bookmark.delete(bookmarks.first.id)

      expect(bookmarks).not_to include(bookmark)
    end
  end

  describe '.find' do
    it 'finds a bookmark depending on id' do
      bookmark = Bookmark.create('Makers', 'http://www.makersacademy.com')
      found_vals = Bookmark.find(bookmark.id)
      expect(found_vals.id).to eq(bookmark.id)
      expect(found_vals.title).to eq(bookmark.title)
      expect(found_vals.url).to eq(bookmark.url)
    end
  end

  describe '.update' do
    it 'updates existing bookmark' do
      bookmark = Bookmark.create('Makers', 'http://www.makersacademy.com')
      found_vals = Bookmark.find(bookmark.id)
      new_title = "Makers Academy"
      new_url = "http://academyofmakers.com"
      updated = Bookmark.update(new_title, new_url, found_vals.id)
      expect(updated.title).to eq(new_title)
      expect(updated.url).to eq(new_url)
  end
end
end