class Api::V1::UsersController < ApplicationController
  before_action :set_user, except: [:index]

  def index
    # sometimes we need to serve all the users
    # sometimes we need to serve only the requested "batch" -- the specific ids
    # that the ember app asked for
    if params[:ids].nil?
      # [{a: "user"}, {another: "user"}]
      # {"users": [{id: 1.....}, {id: 2....}]}
      render json: {"users" => User.all.as_json}
    else
      # params[:ids] - gives us the ids of the users
      # we need to find for ember
      render json: {"users" => User.where(:id => params[:ids]).as_json}
    end
  end

  def show
    render json: @user
  end

  def update
    @user.update_attributes(user_params)
  end

  def delete
    @user.destroy
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,
                                 :email
                                 :twitter_username,
                                 :instagram_username,
                                )
  end

end
