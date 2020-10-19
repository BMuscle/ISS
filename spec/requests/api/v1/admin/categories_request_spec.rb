require 'rails_helper'

RSpec.describe "Api::V1::Admin::Categories", type: :request do
  describe '管理者ユーザでログイン済み' do
    let(:login_user) { create(:user, admin: true) }

    before do
      sign_in login_user
    end

    describe 'POST api/v1/admin/categories' do
      context "Valid" do
        let(:category) { build(:category) }

        it "作成に成功すること" do
          post api_v1_admin_categories_path, params: { category: { name: category.name } }
          expect(response).to have_http_status(:created)
        end
      end

      context "Not Valid" do
        let(:category) { build(:category, name: '') }

        it "エラーメッセージが返る" do
          post api_v1_admin_categories_path, params: { category: { name: category.name } }
          expect(response_json).to eq(["カテゴリー名を入力してください"])
        end
      end
    end

    describe 'GET api/v1/admin/categories/:id' do
      let(:category) { create(:category) }

      before do
        category
      end

      it 'JSONデータが返る' do
        get api_v1_admin_category_path(category.id)
        expect(response_json).to eq({ id: category.id, name: category.name })
      end
    end

    describe 'PUT api/v1/admin/categories/:id' do
      let(:category) { create(:category) }

      before do
        category
      end

      context "Valid" do
        it "作成に成功すること" do
          put api_v1_admin_category_path(category.id), params: { category: { name: "#{category.name}:edit" } }
          expect(response).to have_http_status(:no_content)
        end
      end

      context "Not Valid" do
        it "エラーメッセージが返る" do
          put api_v1_admin_category_path(category.id), params: { category: { name: "" } }
          expect(response_json).to eq(["カテゴリー名を入力してください"])
        end
      end
    end

    describe 'DELETE api/v1/admin/categories/:id' do
      let(:category) { create(:category) }

      before do
        category
      end

      it "204が返る" do
        delete api_v1_admin_category_path(category.id)
        expect(response).to have_http_status(:no_content)
      end
    end
  end

  describe '管理者ユーザでログイン済み' do
    let(:login_user) { create(:user, admin: false) }

    before do
      sign_in login_user
    end

    describe 'POST api/v1/admin/categories' do
      let(:category) { build(:category) }

      it "404が返る" do
        post api_v1_admin_categories_path, params: { category: { name: category.name } }
        expect(response).to have_http_status(:not_found)
      end
    end

    describe 'GET api/v1/admin/categories/:id' do
      let(:category) { create(:category) }

      before do
        category
      end

      it '404が返る' do
        get api_v1_admin_category_path(category.id)
        expect(response).to have_http_status(:not_found)
      end
    end

    describe 'PUT api/v1/admin/categories/:id' do
      let(:category) { create(:category) }

      before do
        category
      end

      it "404が返る" do
        put api_v1_admin_category_path(category.id), params: { category: { name: "#{category.name}:edit" } }
        expect(response).to have_http_status(:not_found)
      end
    end

    describe 'DELETE api/v1/admin/categories/:id' do
      let(:category) { create(:category) }

      before do
        category
      end

      it "404が返る" do
        delete api_v1_admin_category_path(category.id)
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
