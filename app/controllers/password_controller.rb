class PasswordController < ApplicationController
  def forget_password
    if request.post?
      @user = User.find_by_email(params[:email])
      if @user
        new_password = create_random_password
        @user.update(:password=>new_password)
        PostmanMailer.forget_password_alert(@user).deliver
        redirect_to account_login_url
      else
        flash[:notice] = "Invalid email id. Please enter valid email"
        render :action => forget_password
      end
    end
  end

  def create_random_password
    (0...6).map { (65 + rand(26)).chr }.join
  end
  
    # iden=session[:user]
    # entered_password= params[:password]
    # @user=User.find_by_id(iden)
    # if session[:user]
    #   @user.update(:password=>entered_password)
    #   redirect_to account_login_url
    # end

    def reset_password
      @user = User.find(session[:user])
      if request.post?
        if @user
          if @user.update(user_params)
            PostmanMailer.alert_reset_pass(@user).deliver
            flash[:notice]= "Password reseted"
            redirect_to account_dashboard_url
          else
            render :action=> :reset_password
          end
        end
      end
    end

    def user_params
      params.permit(:password,:password_confirmation)
    end
end
