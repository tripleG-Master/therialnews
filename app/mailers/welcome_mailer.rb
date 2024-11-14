class WelcomeMailer < ApplicationMailer

    default from: "welcome@therialnews.com"

    def welcome_email
        @user = params[:user]
        #@url  = "http://example.com/login"
        #mail(to: @user.email, subject: "Welcome to My Awesome Site")
        mail(to: @user.email, subject: "Sign up successfully")    
    end


end
