class UsersController < ApplicationController


    get '/signup' do 
        erb :'users/new'
    end


    post '/signup' do 
        if params[:username] == "" || params[:password] == ""
          redirect '/signup'
        else
          @user = User.create(:username => params[:username], :password => params[:password])
          session[:user_id] = @user.id
          redirect '/books'
        end
      end
    
      get '/login' do 
        if !session[:user_id]
          erb :'/users/login'
        else
          redirect '/books'
        end
      end
    
      post '/login' do
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
          session[:user_id] = user.id
          redirect '/books'
        else
          flash[:message] = "Wrong password or email. Please try again!"
          redirect '/login'
        end
      end

      get '/logout' do
        if session[:user_id] != nil
          session.destroy
          redirect to '/login'
        else
          redirect to '/'
        end
      end
    
    end