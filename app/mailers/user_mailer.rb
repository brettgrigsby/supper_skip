class UserMailer < ActionMailer::Base
  default from: "invites@supperskip.com"

  def invite_user(user, password)
    @user = user
    @password = password
    @url = staff_signup_path
    mail(to: @user.email, subject: "You've been hired!")
  end
end
