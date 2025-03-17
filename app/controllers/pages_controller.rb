class PagesController < ApplicationController
  def home
    redirect_to pet_trackers_path if logged_in?
  end

end
