class Mailer < ActionMailer::Base
  default from: "info@consultor.com.ua"

  def new_advise(advise)
    @advise = advise
    email = 'inna@sba.in.ua'
    mail(:to => email, :subject => "New advise") do |format|
      format.html
    end
  end
end
