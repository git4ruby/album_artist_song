module Api
  module V1
    class ApplicationController < ActionController::Base
      def respond_to_format(obj)
        respond_to do |format|     
          format.html     
          format.any(:xml, :json) { render request.format.to_sym => obj }   
        end
      end
    end
  end
end
