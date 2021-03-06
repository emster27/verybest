require "rails_helper"

RSpec.describe Venue, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:cuisine) }

    it { should have_many(:best_dishes) }

    it { should have_many(:bookmarks) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
