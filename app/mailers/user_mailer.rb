class UserMailer < ApplicationMailer
  default from: "onboarding@resend.dev"

  def welcome_email(user)
    @user=user
    mail(to: @user.email, subject: "Welcome to the app")
  end
end
