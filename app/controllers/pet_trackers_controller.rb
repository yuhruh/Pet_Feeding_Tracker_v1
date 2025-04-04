class PetTrackersController < ApplicationController
  before_action :set_pet_tracker, only: %i[ show edit update destroy ]
  before_action :require_user, except: %i[ show index ]
  before_action :require_same_user, only: %i[ edit update destroy ]

  # GET /pet_trackers or /pet_trackers.json
  def index
    @pet_trackers = PetTracker.paginate(page: params[:page], per_page: 10)
  end

  # GET /pet_trackers/1 or /pet_trackers/1.json
  def show
  end

  # GET /pet_trackers/new
  def new
    @pet_tracker = PetTracker.new
  end

  # GET /pet_trackers/1/edit
  def edit
  end

  # POST /pet_trackers or /pet_trackers.json
  def create
    @pet_tracker = PetTracker.new(pet_tracker_params)
    @pet_tracker.user = current_user
    @pet_tracker.wet_total_ate_amount = @pet_tracker.wet_amount - @pet_tracker.wet_left_amount
    @pet_tracker.dry_total_ate_amount = @pet_tracker.dry_amount - @pet_tracker.dry_left_amount

    respond_to do |format|
      if @pet_tracker.save
        format.html { redirect_to @pet_tracker, notice: "Pet tracker was successfully created." }
        format.json { render :show, status: :created, location: @pet_tracker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pet_tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_trackers/1 or /pet_trackers/1.json
  def update
    respond_to do |format|
      if @pet_tracker.update(pet_tracker_params)
        format.html { redirect_to @pet_tracker, notice: "Pet tracker was successfully updated." }
        format.json { render :show, status: :ok, location: @pet_tracker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pet_tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_trackers/1 or /pet_trackers/1.json
  def destroy
    @pet_tracker.destroy!

    respond_to do |format|
      format.html { redirect_to pet_trackers_path, status: :see_other, alert: "Pet tracker was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_tracker
      @pet_tracker = PetTracker.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def pet_tracker_params
      params.expect(pet_tracker: [ :date, :time, :brand, :description, :wet_amount, :wet_left_amount, :dry_amount, :dry_left_amount ])
    end

    def require_same_user
      if current_user != @pet_tracker.user && !current_user.admin?
        flash[:alert] = "You can only edit or delete your own cat's records...."
        redirect_to @pet_tracker
      end
    end
end
