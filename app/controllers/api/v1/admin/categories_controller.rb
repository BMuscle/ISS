module Api
  module V1
    module Admin
      class CategoriesController < ApplicationController
        before_action :authenticate_admin!
        before_action :get_category, only: [:show, :update, :destroy]

        def create
          @category = Category.new(category_params)
          if @category.save
            render :show, status: :created
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

        def destroy
          if @category.destroy
            head :no_content
          else
            head :unprocessable_entity
          end
        end

        private

        def category_params
          params.require(:category).permit(:name)
        end

        def get_category
          @category = Category.find(params[:id])
        end
      end
    end
  end
end
