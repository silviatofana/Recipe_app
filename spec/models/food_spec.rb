require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations and associations for Food' do
    it 'is not valid without a name' do
      expect(Food.new).to_not be_valid
    end

    it 'belongs to User' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end
end
