require_relative '../../config/environment'
require_relative '../models/post.rb'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get '/' do
    "HELLO PLEASE GO TO /posts"
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    id = params[:id].to_i
    @post = Post.find(id)

    erb :show
  end

  get '/posts/:id/edit' do
    id = params[:id].to_i
    @post = Post.find(id)
    erb :edit
  end

  patch '/posts/:id' do
    id = params[:id].to_i
    @post = Post.find(id)
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect "/posts/#{@post.id}"
  end


  post '/posts' do
    name = params[:name]
    content = params[:content]
    @post = Post.create(name:name, content:content)
    erb :index
  end

  delete '/posts/:id/delete' do
    id = params[:id].to_i
    @post = Post.find(id)
    @post.delete
    erb :delete
  end

end
