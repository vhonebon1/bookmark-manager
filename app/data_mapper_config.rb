
require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './models/link.rb'
require_relative './models/tag.rb'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
