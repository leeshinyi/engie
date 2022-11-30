module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.all

        render json: @users
      end

      def show
        @user = User.find_by(id: params[:id])
        render json: @user
      end
    end
  end
end
