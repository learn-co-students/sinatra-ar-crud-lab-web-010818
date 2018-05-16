require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
    @posts = Post.all

    erb :index
  end

  get '/' do
    erb :"application"
  end

  get '/posts/new' do
    erb :new_post
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  post '/posts' do
    @post = Post.new(params)
    @post.save
    redirect to :"/posts"
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])

    @post.update(name: params[:name], content: params[:content])

    redirect to :"/posts/#{@post.id}"
  end

  delete '/posts/:id' do
    @post = Post.find(params[:id])

    Post.delete(params[:id])

    erb :post_deleted
  end



end
