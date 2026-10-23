class Admin::PoisController < Admin::BaseController
  def index
    @pois = Poi.all
  end

  def new
    @poi = Poi.new
  end

  def create
    @poi = Poi.new(poi_params)
    if @poi.save
      redirect_to admin_pois_path, notice: "POI criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def poi_params
    params.require(:poi).permit(:name, :description, :category, :address, :latitude, :longitude, :cover_image)
  end
end