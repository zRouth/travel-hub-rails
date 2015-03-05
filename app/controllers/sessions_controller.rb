class SessionsController < Devise::SessionsController
  respond_to :html, :json
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!, { only: [:create]}
  skip_before_action :authenticate_user_from_token!, { only: [:create] }

  def create
    user = User.find_for_database_authentication(email: params[:user][:user_email])

    if user && user.valid_password?(params[:user][:password])
        data = {
          token:      user.authentication_token,
          user_email: user.email
        }
        render json: data, status: 201 and return
    else
      render json: { error: "invalid credentials" }, status: 401
    end
  end
end
