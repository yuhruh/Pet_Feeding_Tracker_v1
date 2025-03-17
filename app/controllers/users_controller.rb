class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @pet_trackers = @user.pet_trackers.paginate(page: params[:page], per_page: 10)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end
  
  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @pet_trackers, notice: "Welcome to Pet Trackers App, #{@user.username}. You have signed up successfully." }
        format.json { render :show, status: :created, location: @pet_tracker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def user_params
    params.expect(user: [ :username, :email, :password ])
  end

  def set_user
    @user = User.find(params[:id])
  end

end