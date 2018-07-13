class CustomerMailer < ActionMailer::Base
  default from: 'notifications@example.com'

   def see_you_next_time_email(email)
    @email = email
    mail(to: @email, subject: 'See you next time!!!')
  end
end
