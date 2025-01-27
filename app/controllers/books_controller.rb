class BooksController < ApplicationController
  def new
    @book_new = Book.new
  end 

  def create
    @book_new = Book.new(book_params)
    if @book_new.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book_new.id)
    else
      @all_books = Book.all
      render :index
    end
  end

  def index
    @book_new = Book.new
    @all_books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
    else
      @all_books = Book.all
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
