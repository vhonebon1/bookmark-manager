require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'tag'

class Link

  include DataMapper::Resource

  has n, :tags, :through => Resource

  property :id,     Serial
  property :title,  String
  property :url,    String
  #property :tag,    String


end

env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!
