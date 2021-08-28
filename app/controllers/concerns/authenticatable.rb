module Concerns
  module Authenticatable
    extend ActiveSupport::Concern
    
    included do
      before_action :authenticate!
    
      def authenticate
        params[:password] == Rails.application.secrets.authentication_password
      end
    
      def authenticate!
        unless authenticate
          head 403
        end
      end
    end
  end
end
