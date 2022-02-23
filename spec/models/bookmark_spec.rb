require "rails_helper"

RSpec.describe Bookmark, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:dish) }

    it { should belong_to(:venue) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
    it { should have_one(:food_type) }
  end

  describe "Validations" do
  end
end
