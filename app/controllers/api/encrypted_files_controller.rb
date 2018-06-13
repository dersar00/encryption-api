class Api::EncryptedFilesController < ApplicationController
  before_action :authenticate_user!,  only: :create

  def create
    data = request.request_parameters['encrypted_file']
    encrypted_file = current_user.encrypted_files.create(data.symbolize_keys)

    render json: {encrypted_file: encrypted_file}
  end

end
