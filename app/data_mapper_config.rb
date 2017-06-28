
=begin
require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './models/link.rb'
require_relative './models/tag.rb'

#env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!
=end
