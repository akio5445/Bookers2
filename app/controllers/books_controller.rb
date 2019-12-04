class BooksController < ApplicationController
  before_action :authenticate
  before_action :correct_book, only: [:edit, :update]

  def index
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      @books = Book.all
      @user = User.find(current_user.id)
      render action: :index
    end
  end

  def new
    @books = Book.alls
    @book = Book.new(book_params)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find_by(id:params[:id])
    @books = @book.user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'Book was successfully created.'
    else
      @books = Book.all
      @user = User.find_by(id:params[:id])
      render action: :index
    end
  end

  def destroy  
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path
  end

  private
    def book_params
        params.require(:book).permit(:title, :body)
    end

end


  # def correct_book
  #   @post = current_user.posts.find_by(id: params[:id])
  #   unless @post
  #     redirect_to books_path
  #   end
  # end

# if  @user != @current_user
        #   redirect_to book_path(current_user.id) and return
        #   @boook = save
        # end

 # if @user != @current_user
        #   redirect_to book_path(current_user.id) and return
        # end
