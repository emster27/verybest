require 'rails_helper'

RSpec.describe BestDishResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'best_dishes',
          attributes: { }
        }
      }
    end

    let(:instance) do
      BestDishResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { BestDish.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:best_dish) { create(:best_dish) }

    let(:payload) do
      {
        data: {
          id: best_dish.id.to_s,
          type: 'best_dishes',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      BestDishResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { best_dish.reload.updated_at }
      # .and change { best_dish.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:best_dish) { create(:best_dish) }

    let(:instance) do
      BestDishResource.find(id: best_dish.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { BestDish.count }.by(-1)
    end
  end
end
