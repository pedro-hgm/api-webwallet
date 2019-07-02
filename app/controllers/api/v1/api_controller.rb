module Api::V1
  class ApiController < ApplicationController
    before_action :valid_api_key!

    private

    def has_valid_api_key?
      request.headers["X-Api-Key"] == AUTH_DETAILS["api_key"]
    end

    def valid_api_key!
      return head :forbidden unless has_valid_api_key?
    end
  end
end
