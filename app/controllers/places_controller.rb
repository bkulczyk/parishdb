class PlacesController < ApplicationController
  before_action :authorize
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @q = current_user.places.includes(:street).ransack(params[:q])
    @places = @q.result.paginate(page: params[:page])
    @streets = current_user.streets
    @features = current_user.features
    @stats= @q.result(distinct: true)
  end

  def show
    @parishioner = current_user.parishioners.build
    @parishioner.place_id = @place.id
    @place.parishioners.build
  end

  def new
    @place = current_user.places.build
  end

  def edit
  end

  def create
    @place = current_user.places.new(place_params)

    if @place.save
      redirect_to @place, notice: 'Adres został dodany.'
    else
      render :new
    end
  end

  def update
    if @place.update(place_params)
      redirect_to @place, notice: 'Adres został zaktualizowany.'
    else
      render :edit
    end
  end

  def destroy
    @place.destroy
    redirect_to places_url, notice: 'Adres i powiązane z nim dane zostały usuniete.'
  end

  private

    def set_place
      @place = current_user.places.find(params[:id])
    end

    def place_params
      params.require(:place).permit(:street_id, :address, :notes, :archive, :feature_ids=>[], parishioners_attributes: [:id, :place_id, :firstname, :lastname, :birth, :user_id, :_destroy, :characteristic_ids=>[]])
    end
end
