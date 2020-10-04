class Api::V1::UsersController < ApplicationController
  before_action :get_users, only: :index

  private

  def get_users
    @users = User.all
  end
end
