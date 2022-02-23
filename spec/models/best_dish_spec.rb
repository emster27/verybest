require 'rails_helper'

RSpec.describe BestDish, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:bookmarks) }

    it { should belong_to(:venue) }

    end

    describe "InDirect Associations" do

    it { should have_one(:cuisine) }

    end

    describe "Validations" do

    end
end
