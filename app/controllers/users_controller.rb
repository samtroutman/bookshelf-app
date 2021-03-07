class UsersController < ApplicationController


    get '/signup' do 
      if logged_in?
        redirect to '/books'
      end
        erb :'users/new'
    end


    post '/signup' do 
        if params[:username] == "" || params[:password] == ""
          redirect to '/signup'
        else
        
          @user = User.new(:username => params[:username], :password => params[:password])
          
          @user.save
          
          session[:user_id] = @user.id
          
          redirect to "/books"
      end
      end
    
      get '/login' do 
        if !logged_in?
          erb :'/users/login'
        else
          redirect '/books'
        end
      end
    
      post "/login" do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id

            redirect "/books"
        else
            redirect "/signup"
        end
    end

      get '/logout' do
        session.clear
        redirect "/"
      end
    
    end