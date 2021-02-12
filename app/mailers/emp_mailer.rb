class EmpMailer < ApplicationMailer
  def vote_confirmation(emp)
    @emp = emp
    mail to: @emp.email, subject: "Challenge Upvoted"
  end
end
