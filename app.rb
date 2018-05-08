require 'sinatra/base'


class Bookmarks < Sinatra::Base

  get '/' do
  erb :index
  end

end
