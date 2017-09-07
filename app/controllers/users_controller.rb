class UsersController < ApplicationController
  include UsersHelper

  before_action :get_user_from_id, only: [:show, :edit, :destroy, :update]
  before_action :is_authorized?, only: [:edit, :update, :destroy]
  before_action :is_accessing_self?, only: [:show, :edit, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Your profile has been created successfully"
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.join("\n")
      render(new_user_path)
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Your profile has been updated successfully"
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.join("\n")
      render(:action => "edit")
    end
  end

  def destroy
    if @user.destroy
      delete_session
      flash[:success] = "Your profile has been deleted"
      redirect_to listings_path
    else
      flash[:error] = @user.errors.full_messages.join("\n")
      custom_redirect_back
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone, :email, :password)
  end
end
