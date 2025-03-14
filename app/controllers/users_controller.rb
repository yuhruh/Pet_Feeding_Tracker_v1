class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @pet_trackers = @user.pet_trackers.paginate(page: params[:page], per_page: 10)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end
  
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to pet_trackers_path, notice: "Welcome to Pet Trackers App, #{@user.username}. You have signed up successfully." }
        format.json { render :show, status: :created, location: @pet_tracker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to pet_trackers_path, notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @pet_tracker }
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

end