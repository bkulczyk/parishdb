class ParishionersController < ApplicationController
  before_action :authorize
  before_action :set_parishioner, only: [:show, :edit, :update, :destroy]

  def index
    @q = current_user.parishioners.includes(:place).ransack(params[:q])
    @parishioners = @q.result.paginate(page: params[:page])
    @stats= @q.result(distinct: true)
  end

  def show
    @visit = current_user.visits.build
    @visit.parishioner_id = @parishioner.id
    @parishioner.visits.build
  end

  def new
  end

  def edit
  end

  def create
    @place = current_user.places.find(params[:place_id])
    @parishioner = @place.parishioners.create(parishioner_params)
    redirect_to @place
  end

  def update
    if @parishioner.update(parishioner_params)
      redirect_to @parishioner, notice: 'Osoba została zaktualizowana.'
    else
      render :edit
    end
  end

  def destroy
    @place = current_user.places.find(params[:place_id])
    @parishioner = @place.parishioners.find(params[:id])
    @parishioner.destroy
    redirect_to place_path(@place), notice: 'Osoba została usunięta.'
  end

  private

    def set_parishioner
      @parishioner = current_user.parishioners.find(params[:id])
    end
    def set_place
      @place= current_user.places.find(params[:place_id])
    end

    def parishioner_params
      params.require(:parishioner).permit(:firstname, :lastname, :birth, :birth_place, :place_id, :phone, :email, :death_mark, :death_date, :baptism_date, :baptism_parish, :baptism_number, :confirmation_name, :confirmation_witness, :confirmation_date, :confirmation_number, :notes, :archive, :user_id, :characteristic_ids=>[], visits_attributes: [:id, :visit_id, :issue, :parishioner_id, :minister_id, :eucharist, :anointing, :confession, :notes, :user_id, :_destroy])
    end
end
