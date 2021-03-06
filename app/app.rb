ENV['RACK_ENV'] ||= 'development'

require 'sinatra'
require 'sinatra/flash'
require_relative './models/link.rb'
require_relative './models/tag.rb'
require_relative 'data_mapper_config'

class Bookmark_manager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/add_links'
  end

  post '/links' do
     link = Link.create(url: params[:url], title: params[:title])
     params[:name].split.each do |tag|
       link.tags << Tag.first_or_create(name: tag)
     end
     link.save
     redirect to('/links')
   end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    if session[:user_id]
      redirect to('/links')
    else
      flash[:error] = "Password and confirmation password do not match"
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
