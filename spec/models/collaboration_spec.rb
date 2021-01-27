require 'rails_helper'

RSpec.describe Collaboration, type: :model do
    describe "Associations" do
        it { should belong_to(:emp) }
        it { should belong_to(:challenge) }
    end

    describe "Validations" do
        it { should validate_presence_of(:emp_id) }
        it { should validate_presence_of(:challenge_id) }
    end
end
