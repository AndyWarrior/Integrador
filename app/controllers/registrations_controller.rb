class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    current_user_root # Or :prefix_to_your_route
  end

end