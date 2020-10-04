module Api
  module V1
    class UsersController < ApplicationController
      before_action :get_users, only: :index

      private

      def get_users
        @users = User.all
      end
    end
  end
end
