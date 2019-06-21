require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'successfully sets up a database connection' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
    
      DatabaseConnection.setup('bookmark_manager_test')
    end

    it 'maintains the connection' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq(connection)
    end
  end
  
  describe '.query' do 
    it 'It loads a bookmark into the database' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
      
      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end