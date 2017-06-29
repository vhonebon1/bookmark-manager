ENV['RACK_ENV'] ||= 'development'

require 'sinatra'
require_relative './models/link.rb'
require_relative './models/tag.rb'
require_relative 'data_mapper_config'

class Bookmark_manager < Sinatra::Base

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

end
