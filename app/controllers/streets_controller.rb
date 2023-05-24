class StreetsController < ApplicationController
  before_action :authorize
  before_action :set_street, only: [:show, :edit, :update, :destroy]

  def index
    @q = current_user.streets.ransack(params[:q])
    @streets = @q.result.paginate(page: params[:page])
    @features = current_user.features.references(:places).references(:streets)
    @places = current_user.places
  end

  def show
  end

  def new
    @street = current_user.streets.build
  end

  def edit
  end

  def create
    @street = current_user.streets.build(street_params)

    if @street.save
      redirect_to @street, notice: 'Dodano ulicę.'
    else
      render :new
    end
  end

  def update
    if @street.update(street_params)
      redirect_to @street, notice: 'Zaktualizowano ulicę.'
    else
      render :edit
    end
  end

  def destroy
    @street.destroy
    redirect_to streets_url, notice: 'Usunięto ulicę i powiązane z nią dane.'
  end

  private
    def set_street
      @street = current_user.streets.find(params[:id])
    end

    def street_params
      params.require(:street).permit(:name, :notes, :archive)
    end
end
