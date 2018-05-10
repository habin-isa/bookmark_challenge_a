require 'sinatra/base'
require './lib/stored_bookmarks'
require 'sinatra/flash'

class Bookmarks < Sinatra::Base

enable :sessions
register Sinatra::Flash

  get '/' do
    @bookmark = StoredBookmarks.all
  erb :index
  end

  post '/form' do
    flash[:notice] = 'This is not U R (ea) L (ife)' unless StoredBookmarks.add(params['bookmark'], params['title'])
    redirect('/')
  end

end
