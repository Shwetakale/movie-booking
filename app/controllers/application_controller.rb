# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, if: :xhr_request?

  def xhr_request?
    request.xhr?
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || movies_path
  end
end
