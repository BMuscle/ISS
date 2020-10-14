module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :get_categories, only: :index
      before_action :get_category, only: [:show, :update]

      def create
        @category = Category.new(category_params)
        if @category.save
          head :created
        else
          render json: @category.errors.full_messages, status: :unprocessable_entity
        end
      end

      def update
        if @category.update(category_params)
          head :no_content
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

      def get_category
        @category = Category.find(params[:id])
      end
    end
  end
end
