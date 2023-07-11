class CoordinatorsController < ApplicationController
  require 'csv'
	before_action :load_coordinator, only: [:show, :edit, :update, :destroy, :export_participants]

	def export_participants
    participants = @coordinator.participants

    respond_to do |format|
      format.csv { send_data participants.to_csv, filename: "participants.csv" }
    end
  end

  def index
    @coordinators = Coordinator.all
  end

  def show
    @enrollments = @coordinator.enrollments
  end

  def new
    @coordinator = Coordinator.new
  end

  def create
    @coordinator = Coordinator.new(coordinator_params)

    if @coordinator.save
      redirect_to @coordinator, notice: 'Coordinator was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @coordinator.update(coordinator_params)
      redirect_to @coordinator, notice: 'Coordinator was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @coordinator.destroy
    redirect_to coordinators_url, notice: 'Coordinator was successfully destroyed'
   end

  private

  def load_coordinator
  	@coordinator = Coordinator.find(params[:id])
  end

  def coordinator_params
    params.require(:coordinator).permit(Coordinator::PERMITTED_PARAMS)
  end
end
