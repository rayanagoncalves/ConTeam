class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :set_user, except: [:create, :index]

  # GET /users
  def index
      @users = User.all
      render json: @users, status: :ok
  end

  # GET /users/1
  def show
      render json: @user, status: :ok
  end

  # POST /users
  def create
      @user = User.new(user_params)
      if @user.save
      render json: @user, status: :created
      else
      render json: { errors: @user.errors.full_messages },
              status: :unprocessable_entity
      end
  end

  # PUT /users/1
  def update
      unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
              status: :unprocessable_entity
      end
  end

  # DELETE /users/1
  def destroy
      @user.destroy
  end

  private

  def set_user
      @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
      params.permit(:name, :email, :password, :password_confirmation)
  end
end
