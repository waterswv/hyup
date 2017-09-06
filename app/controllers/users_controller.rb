class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Your profile has been created successfully"
      session[:user_id] = user.id
      #redirect_to user_path(user)
      redirect_to '/listings'
    else
      @user = user
      flash[:error] = user.errors.full_messages.join("\n")
      render('/users/new')
    end

  end

  def edit
    user_id = params[:id]
    @user = User.find_by_id(user_id)
  end

  def show
    user_id = params[:id]
    @user = User.find_by_id(user_id)
  end

  def update
    user_id = params[:id]
    user = User.find_by_id(user_id)
    if user.update_attributes(user_params)
      flash[:success] = "Your profile has been updated successfully"
      #redirect_to user_path(user)
      redirect_to '/listings'
    else
      @user = user
      flash[:error] = user.errors.full_messages.join("\n")
      render(:action => "edit ")
    end

  end

  def destroy
    user_id = params[:id]
    user = User.find_by_id(user_id)
    user.destroy
    delete_session
    flash[:success] = "Your profile has been deleted"
    redirect_to listings_path
  end


  def has_listing?
    true
  end

  def getListing
    16
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone, :email, :password)
  end
end
