require 'rails_helper'

RSpec.describe Recipe, type: :model do
  # Test associations.
  describe 'associations' do
    it 'has many RecipeFood' do
      association = described_class.reflect_on_association(:recipe_foods)
      expect(association.macro).to eq :has_many
    end

    it 'belongs to User' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end
end
