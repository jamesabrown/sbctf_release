class Database
  class << self
    def connection
      unless defined?(@db)
        @db = SQLite3::Database.new "production.sqlite"
  
        @db.execute "CREATE TABLE IF NOT EXISTS posts(Id INTEGER PRIMARY KEY, description POST)"
        @db.execute "INSERT INTO posts(description) VALUES('Today was a <b>great</b> day')"
        @db.execute "INSERT INTO posts(description) VALUES('Today I ate an apple')"
        @db.execute "INSERT INTO posts(description) VALUES('It was very tasty')"
        @db.execute "INSERT INTO posts(description) VALUES('Check it out! <img src=\"/img/apple.jpeg\">')"
      end

      @db
    end

    def reset!
      if @db
        @db.execute "DROP TABLE posts"
        remove_instance_variable(:@db)
      end
    end
  end
end