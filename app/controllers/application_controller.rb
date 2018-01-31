require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  ## Index Action
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  ##New Actions
  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(params)
    @posts = Post.all
    status 200
    erb :index
  end

  ##Show Action
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  ##Edit Actions
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

  ##Delete Action
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    @msg = "#{@post.name} was deleted"
    redirect to "/posts?msg=#{@msg}"
  end

end
