module Api::V1
  class ApiController < ApplicationController
    before_action :valid_api_key!

    private

    def has_valid_api_key?
      if Rails.env.development?
        request.headers["X-Api-Key"] == AUTH_DETAILS["api_key"]
      else
        request.headers["X-Api-Key"] == ENV["AUTH_DETAILS"]
      end
    end

    def valid_api_key!
      return head :forbidden unless has_valid_api_key?
    end
  end
end
