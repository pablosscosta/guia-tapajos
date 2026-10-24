class Admin::PoisController < Admin::BaseController
  def index
    @pois = Poi.all
  end

  def new
    @poi = Poi.new
  end

  def create
    @poi = current_user.pois.build(poi_params)
    @poi.status = :approved

    if @poi.save
      redirect_to admin_pois_path, notice: "POI criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def approve
    @poi = Poi.find(params[:id])
    @poi.approved!
    redirect_to admin_pois_path, notice: "POI aprovado com sucesso!"
  end

  def reject
    @poi = Poi.find(params[:id])
    @poi.rejected!
    redirect_to admin_pois_path, notice: "POI rejeitado com sucesso!"
  end

  private

  def poi_params
    params.require(:poi).permit(:name, :description, :category, :address, :latitude, :longitude, :cover_image)
  end
end