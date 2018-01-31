require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do
  #
  # end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(params[:post])
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    erb :show
  end

  get "/posts/:id/edit" do
    @post = Post.find_by(id: params[:id])
    erb :edit
    end

  patch "/posts/:id" do
    @post = Post.find_by(id: params[:id])
    @post.name = params[:post][:name]
    @post.content = params[:post][:content]
    @post.save

    redirect "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy
    erb :delete
    end

end
