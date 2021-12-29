class ContactMailer < ApplicationMailer
  default from: 'from@example.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_us_email.subject
  #
  def contact_us_email(contact)
    @contact = contact
    mail(to: 'example@example.com',
         subject: 'HoshiMeへのお問い合わせ')
  end
end
