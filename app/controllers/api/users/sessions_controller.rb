class Api::Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_signed_out_user

def create
  user = warden.authenticate!(auth_options)
  token = Tiddle.create_and_return_token(user, request)
  render json: { authentication_token: token, msg: 'You have successfully logged in.' }
end

def destroy
  Tiddle.expire_token(current_user, request) if current_user
  render json: {}
end

end
