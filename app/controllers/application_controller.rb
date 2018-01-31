require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect to "/posts/#{params[:id]}"
  end

  delete '/posts/:id' do
    @post = Post.find(params[:id])
    @msg = "#{@post.name} was deleted"
    Post.find(params[:id]).destroy
    redirect to "/posts?msg=#{@msg}"
  end


  post '/posts' do
    @post = Post.create(params)
    @posts = Post.all
    status 200
    erb :index
  end

end
