require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
  set :method_override, true

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :new
  end

end
