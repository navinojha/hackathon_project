require "rails_helper"

RSpec.describe Tag, type: :model do
  before(:each) do
    @current_user = Emp.create(empid: "E02", email: "dineshmbps1@gmail.com", password: "123456", password_confirmation: "123456")
  end

  after(:each) do
    @current_user.destroy
  end

  describe "association of Tags" do
    it { should belong_to(:challenge) }
  end
  describe "validation of Tags" do
    it { should validate_presence_of(:name) }
  end
  context "Tag adding" do
    it "should be invalid if tag is being added and challenge does not exist" do
      sample_tag = Tag.new(name: "Test training")
      expect(sample_tag).to_not be_valid
    end
  end
  context "adding and deleting tag with challenge" do
    it "should create tag on creation of new Challenge" do
      #test_user = Emp.create(empid: "E02", email: "dineshmbps1@gmail.com", password: "123456", password_confirmation: "123456")
      sample_challenge = @current_user.challenges.build(title: "challenge_title", description: "challenge description")
      if sample_challenge.save
        sample_tag = sample_challenge.tags.create(name: "Test_tag")
      end
      expect(Tag.last.name).to eql "Test_tag"
      #@current_user.destroy
    end
    it "should delete tag on deletetion of new Challenge" do
      #test_user = Emp.create(empid: "E02", email: "dineshmbps1@gmail.com", password: "123456", password_confirmation: "123456")
      sample_challenge = @current_user.challenges.build(title: "challenge_title", description: "challenge description")
      if sample_challenge.save
        sample_challenge.tags.create(name: "Test_tag")
      end
      if sample_challenge.destroy
        chec_tag = Tag.last
        expect(chec_tag).to be nil
      end
      #@current_user.destroy
    end
  end
end
