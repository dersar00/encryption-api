class Api::Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!,  only: :destroy
  skip_before_action :verify_signed_out_user

def create
  user = warden.authenticate!(auth_options)
  token = Tiddle.create_and_return_token(user, request)
  render json: { authentication_token: token, email: user.email }
end

def destroy
  Tiddle.expire_token(current_user, request) if current_user
  render json: {}
end

end
