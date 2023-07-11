class RegistriesController < ApplicationController
	 before_action :load_registry, only: [:show, :edit, :update, :destroy]

  def index
    @registries = Registry.all
  end

  def show
    @participants_by_coordinator = @registry.participants.group_by(&:coordinators)
  end

  def new
    @registry = Registry.new
  end

  def create
    @registry = Registry.new(registry_params)

    if @registry.save
      redirect_to @registry, notice: 'Registry was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @registry.update(registry_params)
      redirect_to @registry, notice: 'Registry was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @registry.destroy
    redirect_to registries_url, notice: 'Registry was successfully destroyed.'
  end

  private

  def load_registry
    @registry = Registry.find(params[:id])
  end

  def registry_params
    params.require(:registry).permit(Registry::PERMITTED_PARAMS)
  end
end
