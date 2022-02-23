require 'rails_helper'

RSpec.describe BestDishResource, type: :resource do
  describe 'serialization' do
    let!(:best_dish) { create(:best_dish) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(best_dish.id)
      expect(data.jsonapi_type).to eq('best_dishes')
    end
  end

  describe 'filtering' do
    let!(:best_dish1) { create(:best_dish) }
    let!(:best_dish2) { create(:best_dish) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: best_dish2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([best_dish2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:best_dish1) { create(:best_dish) }
      let!(:best_dish2) { create(:best_dish) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            best_dish1.id,
            best_dish2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            best_dish2.id,
            best_dish1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
