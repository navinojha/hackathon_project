require 'rails_helper'

RSpec.describe Challenge, type: :model do
    subject { Challenge.new(id: 1,
                            title: "My title", 
                            description: "Description",
                            emp_id: "1") 
    }  

    it "is valid is valid attributes" do
        expect(subject).not_to be_valid  
    end

    it "is not valid without a title" do
        subject.title = nil 
        expect(subject).to_not be_valid 
    end

    it "is not valid without a description" do
        subject.description = nil 
        expect(subject).to_not be_valid 
    end

    it "is not valid without a challenge id" do
        subject.id = nil 
        expect(subject).to_not be_valid 
    end

    describe "Associations" do
        it { should belong_to(:emp) }
        it { should have_many(:tags) }
        it { should have_many(:votes) }
        it { should have_many(:collaborations) }
    end

    describe "Validations" do
        it { should validate_presence_of(:title) }
        it { should validate_presence_of(:description) }
    end

    describe "check only authenticated user can send post" do
        it "should be invalid if post is being added and user does not exist" do
          challenge = Challenge.new(title: "Test training", description: "some test description")
          expect(challenge).to_not be_valid
        end
    end

    describe "Adding and removing the Challenges" do
        it "should create new Challenge" do
          new_user = Emp.create(empid: "E01", email: "navin@example.com", password: "123456", password_confirmation: "123456")
          new_challenge = new_user.challenges.build(title: "challenge_title", description: "challenge description")
          expect(new_challenge).to be_valid
          new_user.destroy
        end

        it "should delete the challenge" do
          new_user = Emp.create(empid: "E01", email: "navin@example.com", password: "123456", password_confirmation: "123456")
          new_challenge = new_user.challenges.build(title: "challenge_title", description: "challenge description")
          new_challenge.save
          challenge_to_be_deleted = new_user.challenges.last
          res = true
          if challenge_to_be_deleted.destroy
            res = false
          end
          expect(res).to eq false
          new_user.destroy
        end
    end
end