require 'rails_helper'

RSpec.describe Tag, type: :model do
    describe "Associations" do
        it { should belong_to(:challenge) }
    end

    describe "Validations" do
        it { should validate_presence_of(:name) }
    end
end
