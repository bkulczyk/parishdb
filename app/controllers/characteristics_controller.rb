class CharacteristicsController < ApplicationController
  before_action :authorize
  before_action :set_characteristic, only: [:show, :edit, :update, :destroy]

  def index
    @characteristics = current_user.characteristics
  end

  def show
  end

  def new
    @characteristic = current_user.characteristics.build
  end

  def edit
  end

  def create
    @characteristic = current_user.characteristics.build(characteristic_params)

    if @characteristic.save
      redirect_to @characteristic, notice: 'Grupa została utworzona.'
    else
      render :new
    end
  end

  def update
    if @characteristic.update(characteristic_params)
      redirect_to @characteristic, notice: 'Grupa została zaktualizowana.'
    else
      render :edit
    end
  end

  def destroy
    @characteristic.destroy
    redirect_to characteristics_url, notice: 'Grupa została usunięta.'
  end

  private
    def set_characteristic
      @characteristic = current_user.characteristics.find(params[:id])
    end

    def characteristic_params
      params.require(:characteristic).permit(:name, :notes, :archive)
    end
end
