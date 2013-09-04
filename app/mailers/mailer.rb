class Mailer < ActionMailer::Base
  default from: "info@consultor.com.ua"

  def new_advise(advise)
    @advise = advise
    email = 'inna@sba.in.ua'
    cc = 'gk@sba.in.ua, ftvkun.ad@gmail.com'
    result = mail(to: email, bcc: cc, subject: "New advise #{@advise.created_at}") do |format|
      format.html
    end
    @advise.update_attribute('email_sent', true) if result.errors.empty?
  end

  def new_user(user)
    @user = user
    email = 'inna@sba.in.ua'
    cc = 'gk@sba.in.ua, ftvkun.ad@gmail.com'
    result = mail(to: email, bcc: cc, subject: "New user #{@user.created_at}") do |format|
      format.html
    end
  end
end
