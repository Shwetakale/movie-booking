# frozen_string_literal: true

# This controller will handle all report related requests
class ReportsController < ApplicationController
  before_action :authenticate_user!

  def index; end
end
