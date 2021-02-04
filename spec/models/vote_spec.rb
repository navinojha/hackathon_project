require 'rails_helper'

RSpec.describe Vote, type: :model do
  before(:each) do
    @current_user = Emp.create(empid: "E02", email: "navin@gmail.com", password: "123456", password_confirmation: "123456")
  end

  after(:each) do
    @current_user.destroy
  end

  describe "Associations" do
    it { should belong_to(:emp) }
    it { should belong_to(:challenge) }
  end
end
