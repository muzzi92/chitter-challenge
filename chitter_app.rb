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

end
