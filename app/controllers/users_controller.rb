class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :authenticate_user!


  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
    end

     @user = User.find(params[:id])
  end

  def index

  end

  # userを更新する記述が正しく実装されている
  # showのリンクが正しく実装されている
  def update
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end

    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end


end
