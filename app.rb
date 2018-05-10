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
    if StoredBookmarks.url_check(params['bookmark']) == nil
      flash[:notice] = 'This is not a real URL'
    else
    StoredBookmarks.add(params['bookmark'])
  end
    redirect('/')
  end

end
