class Api::Users::RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)
    resource.save
    if resource.persisted?
      if resource.active_for_authentication?
        token = Tiddle.create_and_return_token(resource, request)
        render json: { authentication_token: token, email: resource.email }
      else
        expire_data_after_sign_in!
        render json: resource
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

end
