class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def set_locale
    if I18n.available_locales.include?(params[:locale]&.to_sym)
      I18n.locale = params[:locale]
    else
      redirect_to "/#{I18n.default_locale}"
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
