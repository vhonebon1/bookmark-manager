require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'tag'

class Link

  include DataMapper::Resource

  has n, :tags, :through => Resource

  property :id,     Serial
  property :title,  String
  property :url,    String

end
