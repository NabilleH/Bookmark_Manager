require 'pg'

def setup_test_database

p "Setting up test database..."

connection = PG.connect(dbname: 'bookmark_manager_test')

#clear the bookmarks table
connection.exec("DROP TABLE comments;")
connection.exec("DROP TABLE bookmarks;")
connection.exec("CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));")
connection.exec("CREATE TABLE comments(id SERIAL PRIMARY KEY, bookmark_id INTEGER REFERENCES bookmarks (id), comment VARCHAR(240));")

end
