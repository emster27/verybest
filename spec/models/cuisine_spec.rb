require "rails_helper"

RSpec.describe Cuisine, type: :model do
  describe "Direct Associations" do
    it { should have_many(:venues) }
  end

  describe "InDirect Associations" do
    it { should have_many(:best_dishes) }

    it { should have_many(:bookmarks) }
  end

  describe "Validations" do
  end
end
