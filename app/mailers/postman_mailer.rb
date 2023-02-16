class PostmanMailer < ApplicationMailer
    def alert_user(user_data)
        @user_name = user_data.first_name
        mail(to: user_data.email, subject: "New User added")
    end
    def forget_password_alert(user_data)
        @user_password = user_data.password
        @user_name = user_data.first_name
        mail(to: user_data.email, subject: "Password Reset Request")
        
    end
    def alert_reset_pass(user_data)
        @user_name = user_data.first_name
        mail(to: user_data.email, subject: "Password resetted")

    end
end
