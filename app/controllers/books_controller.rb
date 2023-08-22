class BooksController < ApplicationController
  
  def index
    @books = Book.all 
  end

  def new
    @books = Book.new
    
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to '/top'
    else
      flash[:notice] = " errors prohibited this book from being saved:"
      @books = Book.all
      render :index
    end
  end 

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end 