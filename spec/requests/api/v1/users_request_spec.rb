require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  let(:login_user) { create(:user) }

  describe 'ログイン済み' do
    before do
      sign_in login_user
    end

    describe 'GET /api/v1/users/current_user' do
      it 'JSONデータが返る' do
        get api_v1_users_current_user_path
        expect(response_json).to eq({ id: login_user.id, nickname: login_user.nickname, admin: login_user.admin })
      end
    end

    describe 'GET /api/v1/users' do
      let(:user_list) { (create_list(:user, 2) << login_user).map { |user| { id: user.id, nickname: user.nickname } } }

      before do
        user_list
      end

      it 'JSONデータが返る' do
        get api_v1_users_path
        expect(response_json).to eq user_list
      end
    end
  end
end
