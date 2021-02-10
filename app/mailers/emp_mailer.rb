class EmpMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.emp_mailer.vote_confirmation.subject
  #
  def vote_confirmation(emp)
    @emp = emp
    mail to: @emp.email, subject: "Challenge Upvoted"
  end
end
