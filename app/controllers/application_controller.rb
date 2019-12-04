class ApplicationController < ActionController::Base
  before_action :authenticate_user!,:configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
  end
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
  
  def authenticate
    unless user_signed_in?
      redirect_to new_user_session_path, :notice => 'if you want to add a notice'
    end
  end
  
  def correct_user
    @user = User.find(params[:id])
    if @user != @current_user
      redirect_to user_path(current_user)
    end
  end

  def correct_book
    @book = Book.find(params[:id])    
    @user = @book.user
    if @user != @current_user
      redirect_to books_path
    end
  end

end


  
  # def authenticate
  #   return if logged_in?
  #   return_to new_user_session_path
  #   end
    
  #   def logged_in?
  #   !!session[:user_id]
  #   end

  # def correct_book
  #   @post = current_user.posts.find_by(id: params[:id])
  #   unless @post
  #     redirect_to books_path
  #   end
  # end

    # def correct_user
  #   @post = current_user.posts.find_by(id: params[:id])
  #   unless @post
  #     redirect_to user_path(current_user)
  #   end
