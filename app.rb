require 'sinatra/base'
require './lib/stored_bookmarks'

class Bookmarks < Sinatra::Base

  get '/' do
    @bookmark = StoredBookmarks.all
  erb :index
  end

  post '/form' do
    StoredBookmarks.add(params[:bookmark])
    redirect('/')
  end

end
