require "rails_helper"

RSpec.describe "best_dishes#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/best_dishes/#{best_dish.id}", params: params
  end

  describe "basic fetch" do
    let!(:best_dish) { create(:best_dish) }

    it "works" do
      expect(BestDishResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("best_dishes")
      expect(d.id).to eq(best_dish.id)
    end
  end
end
