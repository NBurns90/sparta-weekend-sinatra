require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './models/.rb'
require_relative './controllers/_controller.rb'
require_relative './controllers/_controller.rb'

use Rack::MethodOverride
run PostsController
