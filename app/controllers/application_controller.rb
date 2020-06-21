require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
    @posts = Post.all
    erb :"index.html"

  end


  get "/posts/new" do
      erb :"new.html"
    end





  get "/posts/:id" do
    @post = Post.find_by(id: params[:id])

    erb :"show.html"

  end

  get '/posts/:id/edit' do

     @post = Post.find_by_id(params[:id])
    erb :"edit.html"
  end






  post "/posts" do
     newPost = Post.create(params[:post])
     redirect "/posts"

  end




 patch "/posts/:id" do
   @newPost = Post.find_by(id:params[:id])
  @newPost.name = params[:name]
  @newPost.content = params[:content]
  @newPost.save

  erb :"show.html"
 end




  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :"delete.html"

  end



end
