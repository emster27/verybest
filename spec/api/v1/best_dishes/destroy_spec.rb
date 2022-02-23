require 'rails_helper'

RSpec.describe "best_dishes#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/best_dishes/#{best_dish.id}"
  end

  describe 'basic destroy' do
    let!(:best_dish) { create(:best_dish) }

    it 'updates the resource' do
      expect(BestDishResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { BestDish.count }.by(-1)
      expect { best_dish.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
