require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'link'

class Tag

  include DataMapper::Resource

  #has n, :links, :through => Resource

  property :id, Serial
  property :name, String


end

env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!
