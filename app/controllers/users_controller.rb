class UsersController < ApplicationController
  before_action :authenticate
  before_action :correct_user, only: [:edit, :update]

  def home
  end

  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
  end

  def create
    @user.id = current_user.id
    @user = user.new(user_params)
    if @user.save
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def new
    @user = User.new(user_params)
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if 
      @user.update(user_params)
      redirect_to user_path(@user), notice: 'Book was successfully updated.'
    else
      render action: :edit
    end
  end

  def destroy
  end

  private
    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
    end
    
end

# @user = User.find(params[:id])

# if @user != @current_user
        #     redirect_to user_path(current_user.id) and return
        # end