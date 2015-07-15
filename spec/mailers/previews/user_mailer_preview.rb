# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def invite_user(user, password)
    @user = user
    @password = password
    @url = edit_user_url(@user)
    mail(to: @user.email, subject: "You've been hired!")
  end
end
