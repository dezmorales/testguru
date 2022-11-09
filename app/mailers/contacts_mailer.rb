class ContactsMailer < ApplicationMailer
  def send_form(user:, message:)
    @user = user
    @message = message

    mail to: 'tritsfik@gmail.com'
  end
end
