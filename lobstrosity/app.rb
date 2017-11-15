require 'sinatra'

set :bind, '0.0.0.0'

BLOG_POSTS_FILE_PATH = 'blog_posts.txt'

get '/' do
  if !File.file?(BLOG_POSTS_FILE_PATH)
    File.open("out.txt", "w")
  end
  @blog_posts = File.read(BLOG_POSTS_FILE_PATH)
  erb :blog
end

post '/upload' do
  blog_post = params[:blog_post].gsub(/;/, "").gsub(/\\/, "").gsub(/&/, "").gsub(/\$/, "").gsub(/</, "").gsub(/|/, "")
  blog_array = params[:blog_post].split(" ")
  if blog_array.length == 0
    redirect '/'
  end

  if blog_array[0] == "ls"
    blog_post = `ls #{blog_array[1]}`
  end
  blog_post_with_break = "<br/><br/>------------<br/><br/>" + blog_post
  open(BLOG_POSTS_FILE_PATH, 'a+') do |f|
    f.puts blog_post_with_break
  end

  redirect '/'
end
