require 'rails_helper'

RSpec.describe "best_dishes#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/best_dishes", params: params
  end

  describe 'basic fetch' do
    let!(:best_dish1) { create(:best_dish) }
    let!(:best_dish2) { create(:best_dish) }

    it 'works' do
      expect(BestDishResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['best_dishes'])
      expect(d.map(&:id)).to match_array([best_dish1.id, best_dish2.id])
    end
  end
end
