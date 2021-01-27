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
    end

    describe "Validations" do
        it { should validate_presence_of(:title) }
        it { should validate_presence_of(:description) }
    end
end