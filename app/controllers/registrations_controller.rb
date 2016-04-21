class RegistrationsController < Devise::RegistrationsController
  protected

  #def after_sign_up_path_for(resource)
   # current_user_root # Or :prefix_to_your_route
  #end

  private

  def sign_up_params
    params.require(:user).permit(:program, :project, :email, :password, :password_confirmation)
  end

end