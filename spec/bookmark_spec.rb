require 'bookmark'

describe Bookmark do
  describe '#bookmarks' do
    it 'returns a list of bookmarks' do
      
      Bookmark.create('http://www.makersacademy.com')
      Bookmark.create('http://www.destroyallsoftware.com')
      Bookmark.create('http://www.google.com')

      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
     end
     
     it 'adds a new bookmark' do
      url = double("url")
      expect(Bookmark.create(url)).to eq(url)
     end
  end
end
