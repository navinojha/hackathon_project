require "rails_helper"

RSpec.describe EmpMailer, type: :mailer do
  describe "vote_confirmation" do
    let(:mail) { EmpMailer.vote_confirmation }

    it "renders the headers" do
      expect(mail.subject).to eq("Vote confirmation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
