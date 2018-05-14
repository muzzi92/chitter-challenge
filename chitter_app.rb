require 'sinatra'
require './lib/peep'
require './lib/user'

class ChitterApp < Sinatra::Base
  enable :sessions

  get '/' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb(:index)
  end

  post '/posted_peep' do
    @peep = Peep.create(params[:post_peep])
    redirect '/'
  end

  post '/users' do
    user = User.create(params[:name], params[:username], params[:email], params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/users/new' do
    erb(:signup)
  end

  # post '/sessions' do
  #   result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{params['email']}'")
  #   user = User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  #   session[:user_id] = user.id
  #   redirect('/bookmarks')
  # end
  #
  # get '/sessions/new' do
  #   erb(:signin)
  # end

end
