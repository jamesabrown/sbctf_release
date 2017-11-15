require 'sinatra/base'

class Main < Sinatra::Base
  get "/" do
    ctf_flag = ENV['FLAG']

    @username = params[:username] == 'root' ? ctf_flag : params[:username]
    haml :index
  end
end
