require 'pg'

def setup_test_database
    p "Setting up database, please hold..."

    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Clean table
    connection.exec("TRUNCATE bookmarks;")
    
    
end