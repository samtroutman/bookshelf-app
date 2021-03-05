class BooksController < ApplicationController

    get '/books' do 
        @books = Book.all
        erb :'books/index'
    end

    get '/books/new' do 
        erb :'books/new'
    end

    get '/books/:id/edit' do
        @book = Book.find(params[:id])
        erb :'books/edit'
    end

    post "/books/:id" do
        @book = Book.find(params[:id])
        # unless Book.valid_params?(params)
        #   redirect "/books/#{@book.id}/edit?error=invalid book"
        # end
        @book.update(params.select{|b|b=="name" || b=="author" || b=="genre" || b=="rating" || b=="book_id"})
        redirect "/books"
      end

      get "/books/:id" do
        @book = Book.find(params[:id])
        erb :'books/show'
      end
    
      post "/books" do
        # unless Book.valid_params?(params)
        #   redirect "/books/new?error=invalid book"
        # end
        Book.create(params)
        redirect "/books"
      end
end