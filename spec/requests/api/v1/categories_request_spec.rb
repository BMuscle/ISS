require 'rails_helper'

RSpec.describe "Api::V1::Categories", type: :request do
  let(:login_user) { create(:user) }

  describe 'ログイン済み' do
    before do
      sign_in login_user
    end

    describe 'GET api/v1/categories' do
      let(:category_list) { create_list(:category, 2).map { |category| { id: category.id, name: category.name } } }

      before do
        category_list
      end

      it 'JSONデータが返る' do
        get api_v1_categories_path
        expect(response_json).to eq(category_list)
      end
    end
  end
end
