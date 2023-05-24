class VisitsController < ApplicationController
  before_action :authorize
  before_action :set_visit, only: [:show, :edit, :update]

  def index
    @q = current_user.visits.includes(:parishioner).includes(:minister).ransack(params[:q])
    @visits = @q.result.paginate(page: params[:page])
  end

  def show
  end

  def new
    @visit = current_user.visits.build
  end

  def edit
  end

  def create
    @parishioner = current_user.parishioners.find(params[:parishioner_id])
    @visit = @parishioner.visits.create(visit_params)
    redirect_to @parishioner
  end

  def update
    if @visit.update(visit_params)
      redirect_to @visit, notice: 'Wizyta została zaktualizowana.'
    else
      render :edit
    end
  end

  def destroy
    @parishioner = current_user.parishioners.find(params[:parishioner_id])
    @visit = @parishioner.visits.find(params[:id])
    @visit.destroy
    redirect_to parishioner_path(@parishioner), notice: 'Wizyta została usunięta.'
  end

  private
    def set_visit
      @visit = current_user.visits.find(params[:id])
    end

    def visit_params
      params.require(:visit).permit(:issue, :parishioner_id, :minister_id, :eucharist, :confession, :anointing, :notes, :user_id)
    end
end
