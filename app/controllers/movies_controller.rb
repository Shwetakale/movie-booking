# frozen_string_literal: true

# This controller will handle movie related requests
class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index; end
end
