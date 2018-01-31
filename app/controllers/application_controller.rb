require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # new action (CREATE) - 2 controllers - load the form & create action  - post request, creats new post and saves to db and redirects to posts page
  #1. the route
  get '/posts/new' do
    erb :new #renders new.rb view
  end
  #2.Create action
  post '/posts' do
    @posts = Post.create(params)
    # :name => params[:name], :content => [:content]
    redirect to '/posts'
    # "/posts/#{@post.id}"
  end

  #READ action - show and index actions
  #show action
  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show #render view
  end

  # index action - shows all posts
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  #UPDATE action - edit controller action
  #1loading form
    get '/posts/:id/edit' do
      @post = Post.find_by_id(params[:id])
      erb :edit
    end
  #edit action
    patch '/posts/:id' do
      @post = Post.find_by_id(params[:id])
      @post.name = params[:name]
      @post.content = params[:content]
      @post.save
      erb :show
    end

    #DELETE
    delete '/posts/:id/delete' do
      @post = Post.find_by_id(params[:id])
      @post.delete
      erb :delete
    end

  get '/' do

  end

end
