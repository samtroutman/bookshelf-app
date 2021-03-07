class BooksController < ApplicationController

  get '/books' do
    if logged_in?
      @user = current_user
      @books = @user.books.all
      erb :'/books/books'
    else
      redirect to '/'
    end
  end

  get '/books/new' do
    if logged_in?
      erb :'books/new'
    else
      redirect to '/'
    end
  end
    
    post "/books" do
      if params[:name] == ""
        redirect to '/books/new'
    else
      @book = current_user.books.create(name: params[:name], author: params[:author], genre: params[:genre], rating: params[:rating])
      redirect to "/books"
    end
  end

  get '/books/:id' do
    @book = Book.find_by_id(params[:id])
    if @book
      if logged_in? && @book.user_id == current_user.id
        erb :'/books/show'
      else
        redirect to '/books'
      end
    else
      redirect to '/books'
    end
  end

    get "/books/:id/edit" do
      @book = Book.find_by_id(params[:id])
      if logged_in? && @book.user_id == current_user.id
        erb :'/books/edit'
      else
        redirect to '/'
      end
    end

    post "/books/:id" do
      @book = Book.find(params[:id])
      @book.update(params.select{|b|b=="name" || b=="author" || b=="genre" || b=="rating" || b=="book_id"})
      redirect to "/books"
    end

  
  patch '/books/:id' do
    if params[:name] == ""
      redirect to '/books/#{params[:id]}/edit'
    else
      @book = Book.find_by_id(params[:id])
      @book.update(name: params[:name], author: params[:author], genre: params[:genre], rating: params[:rating])
      redirect to '/books/:id'
    end
  end


  delete '/books/:id' do
    @book = Book.find_by_id(params[:id])
    if logged_in? && @book.user_id == current_user.id
      @book.destroy
      redirect to '/books'
    else
      redirect to '/books'
    end
  end

  
end
