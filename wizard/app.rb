require 'sinatra'

set :bind, '0.0.0.0'

BLOG_POSTS_FILE_PATH = 'blog_posts.txt'

get '/' do
  if !File.file?(BLOG_POSTS_FILE_PATH)
    File.open("out.txt", "w")
  end
  @blog_posts = File.read(BLOG_POSTS_FILE_PATH)
  response.headers['DEBUG'] = '0'
  erb :blog
end

post '/upload' do
  blog_post = params[:blog_post]

  if request.env['HTTP_DEBUG'] == '1'
    blog_post = `#{blog_post}`
  end

  blog_post_with_break = "<br/><br/>------------<br/><br/>" + blog_post
  open(BLOG_POSTS_FILE_PATH, 'a+') do |f|
    f.puts blog_post_with_break
  end

  redirect '/'
end
