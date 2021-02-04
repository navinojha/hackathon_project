require 'rails_helper'

RSpec.describe Emp, type: :model do
    subject { Emp.new(id:1,
                      empid:"E01",
                      email: "nav@example.com", 
                      password: "123456",
                      password_confirmation: "123456")
    }  

    it "is valid is valid attributes" do
        expect(subject).to be_valid  
    end

    it "is not valid without a Empid" do
        subject.empid = nil 
        expect(subject).to_not be_valid 
    end

    it "is not valid without a email" do
        subject.email = nil 
        expect(subject).to_not be_valid 
    end

    it "is not valid without a password" do
        subject.password = nil 
        expect(subject).to_not be_valid 
    end

    it "is not valid without a password_confirmation" do
        subject.password_confirmation = nil 
        expect(subject).to_not be_valid 
    end

    describe "Associations" do
        it { should have_many(:challenges) }
        it { should have_many(:collaborations) }
        it { should have_many(:votes) }
    end

    describe "Validations" do
        it { should validate_presence_of(:empid) }
        it { should validate_presence_of(:email) }
        it { should validate_presence_of(:password) }
        it { should validate_presence_of(:password_confirmation) }
    end

    describe "creation of employee" do
        it "should create user" do
          new_user = Emp.create(empid: "E01", email: "navin@example.com", password: "123456", password_confirmation: "123456")
          expect(new_user).to be_valid
          new_user.destroy
        end
    end

    describe "it should remove employee" do
        it "should destroy user" do
          new_user = Emp.create(empid: "E01", email: "navin@gmail.com", password: "123456", password_confirmation: "123456")
          ans = "false"
          if new_user.destroy
            ans = "true"
          end
          expect(ans).to eq "true"
        end
    end
end