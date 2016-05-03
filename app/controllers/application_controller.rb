class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
  	if current_user.nil?
  		'/admin/home'
	else
	  if current_user.first_name == nil then
	  	'/user/form'
	  else
	  	'/home'
	  end
	end
  end
end
