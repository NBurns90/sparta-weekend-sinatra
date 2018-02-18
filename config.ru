require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

require_relative './models/city.rb'
require_relative './models/person.rb'
require_relative './controllers/static_controller.rb'
require_relative './controllers/person_controller.rb'
require_relative './controllers/city_controller.rb'

use Rack::MethodOverride

run Rack::Cascade.new([
  StaticController,
  PersonController,
  CityController
])
