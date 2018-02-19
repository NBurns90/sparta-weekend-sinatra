class CityController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
      register Sinatra::Reloader
  end

  # index
  get '/city' do

    @title = "Cities"
    @cities = City.all

    erb :'city/index'
  end

  # new
  get '/city/new' do

    @city = City.new

    erb :'city/new'
  end

  # show
  get '/city/:id' do
    city_id = params[:id].to_i

    @city = City.find(city_id)

    erb :'city/show'
  end

  # create
  post '/city' do

    city = City.new

    # bind the values
    city.city_name = params[:city_name]
    city.country_name = params[:country_name]
    city.currency = params[:currency]
    city.currency_code = params[:currency_code]

    # save the post
    city.save

    redirect '/city'

  end

  # update
  put '/city/:id' do
    city_id = params[:id].to_i

    # load the object with the id
    city = City.find(city_id)

    # update the values
    city.city_name = params[:city_name]
    city.country_name = params[:country_name]
    city.currency = params[:currency]
    city.currency_code = params[:currency_code]

    # save the post
    city.save

    redirect '/city'
  end

  # delete
  delete '/city/:id' do
    city_id = params[:id].to_i

    City.destroy(city_id)

    redirect '/city'
  end

  # edit
  get '/city/:id/edit' do
    city_id = params[:id].to_i

    @city = City.find(city_id)

    erb :'city/edit'
  end

end
