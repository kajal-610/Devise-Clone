class ProfileController < ApplicationController
  def edit_profile
    @user =User.find(session[:user])
    if request.post?
        if @user.update(user_params)
          redirect_to account_dashboard_url
        else
          render :action=>edit_profile
        end
    end
  end

  def user_params
    params.permit(:first_name,:last_name,:mobile_no,:date_of_birth,:header_image)
  end
end

