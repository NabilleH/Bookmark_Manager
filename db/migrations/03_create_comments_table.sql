CREATE TABLE comments(id SERIAL PRIMARY KEY, bookmark_id INTEGER REFERENCES bookmarks (id), comment VARCHAR(240));
