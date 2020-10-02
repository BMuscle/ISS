require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:login_user) { create(:user) }

  describe 'GET /users/:nickname' do
    before do
      sign_in login_user
    end

    it 'ステータス200 OKが返ってくること' do
      get user_path(login_user.nickname)
      expect(response).to have_http_status(:ok)
    end
  end
end
