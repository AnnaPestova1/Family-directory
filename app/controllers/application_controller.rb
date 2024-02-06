class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: -> { request.xhr? }
  before_action :authenticate_user!
   rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def not_found_method
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end
  def render_404
    render file: 'public/404.html', status: :not_found
  end
end
