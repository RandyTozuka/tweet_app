class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

# 以下の記述に関するqiita
# https://qiita.com/kaito121855/items/e1a80da8557258c497dc
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:account, :name])
  end

end#ofclass
