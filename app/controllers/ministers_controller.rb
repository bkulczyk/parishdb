class MinistersController < ApplicationController
  before_action :authorize
  before_action :set_minister, only: [:show, :edit, :update, :destroy]

  def index
    @ministers = current_user.ministers
  end

  def show
  end

  def new
    @minister = current_user.ministers.build
  end

  def edit
  end

  def create
    @minister = current_user.ministers.build(minister_params)

    if @minister.save
      redirect_to @minister, notice: 'Szafarz został dodany.'
    else
      render :new
    end
  end

  def update
    if @minister.update(minister_params)
      redirect_to @minister, notice: 'Szafarz został zaktualizowny.'
    else
      render :edit
    end
  end

  def destroy
    @minister.destroy
    redirect_to ministers_url, notice: 'Szafarz został usunięty.'
  end

  private
    def set_minister
      @minister = current_user.ministers.find(params[:id])
    end

    def minister_params
      params.require(:minister).permit(:fullname, :notes, :archive)
    end
end
