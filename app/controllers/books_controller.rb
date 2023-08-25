class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @book = Book.new

  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      flash[:notice] = " errors prohibited this book from being saved:"
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="Book was successfully updated."
    redirect_to book_path(@book.id)
    else
    flash[:notice] = " errors prohibited this book from being saved:"
    render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end