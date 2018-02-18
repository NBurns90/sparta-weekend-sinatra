class PersonController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
      register Sinatra::Reloader
  end

  # index
  get '/person' do

    @title = "People"
    @persons = Person.all

    erb :'person/index'
  end

  # new
  get 'person/new' do

    @person = Person.new

    erb :'person/new'
  end

  # show
  get '/person/:id' do
    id = params[:id].to_i

    @person = Person.find(id)

    erb :'person/show'
  end

  # create
  post '/person' do

    person = Person.new

    # bind the values
    person.avatar = params[:avatar]
    person.first_name = params[:first_name]
    person.last_name = params[:last_name]
    person.gender = params[:gender]
    person.city_id = params[:city_id]

    # save the post
    person.save

    redirect '/person'
  end

  # update
  put '/:id' do
    id = params[:id].to_i

    redirect '/'
  end

  # delete
  delete '/:id' do
    id = params[:id].to_i

    redirect '/'
  end

  # edit
  get '/:id/edit' do
    id = params[:id].to_i

    erb :'person/edit'
  end

end
