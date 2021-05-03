require 'gossip'
require 'comment'


class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params['gossip_author'],params['gossip_content']).save
    redirect '/'
  end

  get '/gossips/:id' do 
    erb :show, locals: {comments: Comment.find(params['id']), gossip: Gossip.find(params['id'].to_i)}
  end

  get '/gossips/:id/edit' do
    erb :edit, locals: {gossip: Gossip.find(params['id'].to_i)}
  end

  post '/gossips/:id/edit' do
    Gossip.update(params['id'],params['gossip_author'],params['gossip_content'])
    redirect '/'
  end

  post '/gossips/:id' do
    Comment.new(params['id'],params['comment']).save
    erb :show, locals: {comments: Comment.find(params['id']), gossip: Gossip.find(params['id'].to_i)}
  end 

end
