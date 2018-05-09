require 'sinatra/base'
require './lib/stored_bookmarks'

class Bookmarks < Sinatra::Base

  get '/' do
    @bookmark = StoredBookmarks.new
  erb :index
  end

end
