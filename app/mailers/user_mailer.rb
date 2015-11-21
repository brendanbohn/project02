class UserMailer < ApplicationMailer
	default from: "coparent.application@gmail.com"

	def welcome_email(user)
		@user = user
		@url = "http://www.google.com"
		mail(to: @user.email, subject: "test welcome email")
	end
end
