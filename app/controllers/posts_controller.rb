require_relative '../../config/environment'

class PostsController < Sinatra::Base
  set :views, 'app/views'

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
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
    redirect "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy
    erb :delete
  end
end
