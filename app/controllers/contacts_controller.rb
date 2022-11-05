class ContactsController < ApplicationController
  def new; end

  def create
    user_message = params.dig(:contact_form, :message)

    if valid?(user_message)
      ContactsMailer.send_form(user: current_user, message: user_message).deliver_now

      redirect_to new_contact_path
    else
      render :new
    end
  end

  private

  def valid?(message)
    message.present?
  end
end
