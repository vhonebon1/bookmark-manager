ENV['RACK_ENV'] ||= 'development'

require 'sinatra'
require_relative './models/link.rb'
class Bookmark_manager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/add_links'
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title], tag: params[:tag])
    redirect '/links'
  end

end
