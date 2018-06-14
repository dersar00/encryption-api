class Api::EncryptedFilesController < ApplicationController
  before_action :authenticate_user!,  only: :create

  def create
    data = request.request_parameters['encrypted_file']
    encrypted_file = current_user.encrypted_files.create(data.symbolize_keys)

    render json: {encrypted_files: EncryptedFile.all}
  end

  def index
    render json: {encrypted_files: EncryptedFile.all}
  end

end
