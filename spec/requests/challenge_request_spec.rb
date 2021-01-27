require 'rails_helper'

RSpec.describe "/challenges", type: :get do
  let(:valid_attributes) {
    { title: 'My first', desciption: 'Description', emp_id: 1 }
  }

  let(:invalid_attributes) {
    { title: 'My second' }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Challenge.create! valid_attributes
      get challenges_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      challenge = Challenge.create! valid_attributes
      get challenge_url(challenge)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_challenge_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      challenge = Challenge.create! valid_attributes
      get edit_challenge_url(challenge)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Challenge" do
        expect {
          post challenges_url, params: { challenge: valid_attributes }
        }.to change(Challenge, :count).by(1)
      end

      it "redirects to the created challenge" do
        post challenges_url, params: { challenge: valid_attributes }
        expect(response).to redirect_to(challenge_url(Challenge.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Challenge" do
        expect {
          post challenges_url, params: { challenge: invalid_attributes }
        }.to change(Challenge, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post challenges_url, params: { challenge: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested challenge" do
        challenge = Challenge.create! valid_attributes
        patch challenge_url(challenge), params: { challenge: new_attributes }
        challenge.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the challenge" do
        challenge = Challenge.create! valid_attributes
        patch challenge_url(challenge), params: { challenge: new_attributes }
        challenge.reload
        expect(response).to redirect_to(challenge_url(challenge))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        challenge = Challenge.create! valid_attributes
        patch challenge_url(challenge), params: { challenge: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested challenge" do
      challenge = Challenge.create! valid_attributes
      expect {
        delete challenge_url(challenge)
      }.to change(Challenge, :count).by(-1)
    end

    it "redirects to the challenges list" do
      challenge = Challenge.create! valid_attributes
      delete challenge_url(challenge)
      expect(response).to redirect_to(challenges_url)
    end
  end
end
