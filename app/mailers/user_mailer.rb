class UserMailer < ApplicationMailer
	default from: 'dealsmanagement9@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'localhost:3000/users/signin'
    mail(to: @user.email, subject: 'Welcome to Deals Management')
    
  end
end
