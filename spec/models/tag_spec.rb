require "rails_helper"

RSpec.describe Tag, type: :model do
  before(:each) do
    @current_user = Emp.create(empid: "E02", email: "navin1@gmail.com", password: "123456", password_confirmation: "123456")
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

  describe "Adding Tag" do
    it "should be invalid if tag is being added and challenge does not exist" do
      new_tag = Tag.new(name: "New training")
      expect(new_tag).to_not be_valid
    end
  end

  describe "adding and deleting tag with challenge" do
    it "should be able to create tag on creation of new Challenge" do
      new_challenge = @current_user.challenges.build(title: "challenge_title", description: "challenge description")
      if new_challenge.save
        new_tag = new_challenge.tags.create(name: "Test_tag")
      end
      expect(Tag.last.name).to eql "Test_tag"
    end

    it "should be able to delete tag on deletetion of new Challenge" do
      new_challenge = @current_user.challenges.build(title: "challenge_title", description: "challenge description")
      if new_challenge.save
        new_challenge.tags.create(name: "Test_tag")
      end
      if new_challenge.destroy
        test_tag = Tag.last
        expect(test_tag).to be nil
      end
    end
  end
end
