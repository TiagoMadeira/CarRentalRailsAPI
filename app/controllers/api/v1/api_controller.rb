module API
  module V1
    class APIController < ActionController::API
      include Concerns::ApiConcerns

      before_action :authenticate_user!
    end
  end
end
