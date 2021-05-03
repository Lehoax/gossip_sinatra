require 'gossip'
require 'csv'
class ApplicationController < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/views'
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  get '/gossips/new/' do
    erb :new_gossip
  end
  get '/gossip/:id' do
    erb :show, locals: {gossip: Gossip.find(params['id'])}
  end
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    redirect '/'
  end
  get '/gossip/:id/edit/' do
    erb :edit, locals: {gossip: Gossip.find(params['id'])}
  end
  post '/gossip/edit/:id' do
    Gossip.update(params['id'], params["gossip_author"],params["gossip_content"])
    redirect '/'
  end
end