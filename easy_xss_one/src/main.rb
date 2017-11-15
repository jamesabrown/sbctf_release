require 'sinatra/base'
require 'sqlite3'
require_relative 'database'

class Main < Sinatra::Base
  get "/" do
    @ctf_flag = ENV['FLAG']
    query = Database.connection.prepare('SELECT description FROM posts')
    @posts = query.execute.to_a.flatten

    haml :index
  end

  post '/post' do
    posting = params.delete(:post)
    if posting =~ /\<(script|button)\>/
      Database.connection.execute("INSERT INTO posts(description) VALUES('Tryna hack my site eh? Nice try bud')")
    else
      Database.connection.execute("INSERT INTO posts(description) VALUES('#{SQLite3::Database.quote(posting)}')")
    end
    redirect '/'
  end

  post '/reset_db' do
    Database.reset!
    redirect '/'
  end
end
