class Api::V1::UsersController < ApplicationController
  before_action :set_user, except: [:index]

  def show
    render json: @user
  end

  def update
    @user.update_attributes(user_params)
    if @user.save
      render json: @user
    end
  end

  def destroy
    @user.destroy
    render json: { "status" => "success", "message" => "#{@user.name} was destroyed." }
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :twitter_username,
                                 :instagram_username)
  end
end
