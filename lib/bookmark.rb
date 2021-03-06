require_relative 'database_connection'

class Bookmark
  
  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks;")
    result.map do |bookmark| 
    Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url'])  
    end
  end

  def self.create(title, url)
    result = DatabaseConnection.query("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}') RETURNING id, title, url;")
    Bookmark.new(result[0]['id'], result[0]['title'], result[0]['url'])
  end

  def self.delete(id)
      DatabaseConnection.query("DELETE FROM bookmarks WHERE id = '#{id}';")
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = '#{id}';")
    find = Bookmark.new(result[0]['id'], result[0]['title'], result[0]['url'])  
  end

  def self.update(title, url, id)
    result = DatabaseConnection.query("UPDATE bookmarks SET title = '#{title}', url = '#{url}' WHERE id = '#{id}' RETURNING id, title, url;")
    update = Bookmark.new(result[0]['id'], result[0]['title'], result[0]['url'])  
  end
end
