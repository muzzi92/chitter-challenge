require 'sinatra'
require './lib/peep'

class ChitterApp < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/posted_peep' do
    @peep = Peep.create(params[:post_peep])
    redirect '/'
  end
end
