class UsersController < ApplicationController
    def create
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        render json: user, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def show
        if current_user
          render json: current_user
        else
          head :unauthorized
        end
      end
      
  
    private
  
    def user_params
      params.require(:user).permit(:username, :password)
    end
  end
  