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

    describe 'POST api/v1/categories' do
      context "Valid" do
        let(:category) { build(:category) }

        it "作成に成功すること" do
          post api_v1_categories_path, params: { category: { name: category.name } }
          expect(response).to have_http_status(:created)
        end
      end

      context "Not Valid" do
        let(:category) { build(:category, name: '') }

        it "エラーメッセージが返る" do
          post api_v1_categories_path, params: { category: { name: category.name } }
          expect(response_json).to eq(["カテゴリー名を入力してください"])
        end
      end
    end

    describe 'GET api/v1/categories/:id' do
      let(:category) { create(:category) }

      before do
        category
      end

      it 'JSONデータが返る' do
        get api_v1_category_path(category.id)
        expect(response_json).to eq({ id: category.id, name: category.name })
      end
    end
  end
end
