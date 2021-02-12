# Preview all emails at http://localhost:3000/rails/mailers/emp_mailer
class EmpMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/emp_mailer/vote_confirmation
  def vote_confirmation
    EmpMailer.vote_confirmation(Emp.last)
  end
end
