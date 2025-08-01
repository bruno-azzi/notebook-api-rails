class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :ensure_json_request

  def ensure_json_request
    return if request.headers["Accept"] =~ /vnd\.api\+json/
    render nothing: true, status: 406
  end
end
