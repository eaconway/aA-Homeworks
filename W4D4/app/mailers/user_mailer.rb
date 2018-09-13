class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    # your code here
    @user = user
    @url = 'http://lol.com/'
    mail(to: user.email, subject: 'WELCOME TO THE FRELJORD')
  end
end
