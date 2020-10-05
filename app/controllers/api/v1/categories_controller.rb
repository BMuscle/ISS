module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :get_categories, only: :index

      private

      def get_categories
        @categories = Category.all
      end
    end
  end
end
