class WelcomeMailer < ApplicationMailer
  default from: 'fauxbook@odin-fauxbook.herokuapp.com'
  include SendGrid

  def welcome_email(user)
    @user = user
    @url = 'https://odin-fauxbook.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Fauxbook')
  end
end
