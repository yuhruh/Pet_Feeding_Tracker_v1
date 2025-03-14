class UsersController < ApplicationController

  def new
    @user = User.new
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

  private
  def user_params
    params.expect(user: [ :username, :email, :password ])
  end

end