require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Validation' do
    context '正常系' do
      it "is valid with valid attributes" do
        category = build(:category)
        expect(category).to be_valid
      end
    end

    context '異常系' do
      it "is not valid without a name" do
        category = build(:category, name: nil)
        category.valid?
        expect(category.errors[:name]).to include("を入力してください")
      end

      it "is not valid with a not unique name" do
        name = "test_name"
        create(:category, name: name)
        category = build(:category, name: name)
        category.valid?
        expect(category.errors[:name]).to include("はすでに存在します")
      end

      it "is not valid with a 21 characters or more name" do
        category = build(:category, name: 'a' * 21)
        category.valid?
        expect(category.errors[:name]).to include("は20文字以内で入力してください")
      end
    end
  end
end
