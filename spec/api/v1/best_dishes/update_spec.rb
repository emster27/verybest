require "rails_helper"

RSpec.describe "best_dishes#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/best_dishes/#{best_dish.id}", payload
  end

  describe "basic update" do
    let!(:best_dish) { create(:best_dish) }

    let(:payload) do
      {
        data: {
          id: best_dish.id.to_s,
          type: "best_dishes",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(BestDishResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { best_dish.reload.attributes }
    end
  end
end
