require 'sinatra'
require 'sinatra/reloader' if development?
require 'rack'
require 'rack/rewrite'
require 'pg'

require_relative './models/city.rb'
require_relative './models/person.rb'
require_relative './controllers/static_controller.rb'
require_relative './controllers/person_controller.rb'
require_relative './controllers/city_controller.rb'

use Rack::MethodOverride

# use Rack::Rewrite do
#   r301 %r{(.+)/$}, '$1'
# end

run Rack::Cascade.new([
  StaticController,
  PersonController,
  CityController
])
