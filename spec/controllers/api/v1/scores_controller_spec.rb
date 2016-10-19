require 'rails_helper'

RSpec.describe Api::V1::ScoresController, type: :controller do
  let(:score) { create(:score) }
  let(:valid_attributes) { attributes_for(:score) }
  let(:invalid_attributes) { attributes_for(:score, :invalid) }

  describe "GET #index" do
    it "to return scores" do
      get :index, params: { text_id: score.text_id }

      expect(response.body).to eq(Score.all.to_json)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Score" do
        post :create, params: {score: valid_attributes}

        expect(Score.all.count).to eq(1)
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "does not create a new score" do
        post :create, params: {score: invalid_attributes}

        expect(Score.all.count).to eq(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
