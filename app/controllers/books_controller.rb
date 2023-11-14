class BooksController < ApplicationController
  
  def top
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice]="Book was successfully created."
      redirect_to book_path(@book.id)
    else
      flash.now[:error]="2 errors prohibited this book from being saved:"
      flash.now[:alert]="▪️Title can't be blank"
      flash.now[:notice]="▪️Body can't be blank"
      render :new
    end

  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)

  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
