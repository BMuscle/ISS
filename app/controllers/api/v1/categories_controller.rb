module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :get_categories, only: :index

      def create
        @category = Category.new(category_params)
        if @category.save
          head :created
        else
          render json: @category.errors.full_messages, status: :unprocessable_entity
        end
      end

      private

      def category_params
        params.require(:category).permit(:name)
      end

      def get_categories
        @categories = Category.all
      end
    end
  end
end
