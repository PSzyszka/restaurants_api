class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    if @message.save
      UserMailer.notification_email(@message).deliver
      render json: { status: 'Message was send successfully.' }, status: 201
    else
      render json: { errors: message.errors }, status: 422
    end
  end

  private

  def message_params
    params.require(:message).permit(:title, customer_attributes: :email)
  end
end
