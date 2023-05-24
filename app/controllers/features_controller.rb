class FeaturesController < ApplicationController
  before_action :authorize
  before_action :set_feature, only: [:show, :edit, :update, :destroy]

  def index
    @features = current_user.features
    @places = current_user.places
    @streets = current_user.streets
  end

  def show
  end

  def new
    @feature = current_user.features.build
  end

  def edit
  end

  def create
    @feature = current_user.features.build(feature_params)

    if @feature.save
      redirect_to @feature, notice: 'Tag adresowy został dodany.'
    else
      render :new
    end
  end

  def update
    if @feature.update(feature_params)
      redirect_to @feature, notice: 'Tag adresowy został zaktualizowany.'
    else
      render :edit
    end
  end

  def destroy
    @feature.destroy
    redirect_to features_url, notice: 'Tag adresowy został usuniety.'
  end

  private
    def set_feature
      @feature = current_user.features.find(params[:id])
    end

    def feature_params
      params.require(:feature).permit(:name, :notes, :archive)
    end
end
