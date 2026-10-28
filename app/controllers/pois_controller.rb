class PoisController < ApplicationController
  before_action :set_poi, only: %i[ show edit update destroy ]

  # Listagem Pública (Home / Mapa)
  # GET /pois
  def index
    @pois = Poi.approved

    if params[:query].present?
      @pois = @pois.where("name LIKE ? OR address LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end

    if params[:category].present?
      @pois = @pois.joins(:categories).where(categories: { name: params[:category] }).distinct
    end

    if params[:latitude].present? && params[:longitude].present?
      radius = params[:radius].present? ? params[:radius].to_f : 20
      @pois = @pois.near_location(params[:latitude], params[:longitude], radius)
    end
  end

  # Painel do Parceiro (Meus Pontos)
  # GET /pois/my_pois
  def my_pois
    @pois = current_user.pois.order(created_at: :desc)
  end

  # GET /pois/1
  def show
  end

  # GET /pois/new
  def new
    @poi = Poi.new
  end

  # GET /pois/1/edit
  def edit
  end

  # POST /pois
  def create
    @poi = current_user.pois.build(poi_params)
    @poi.status = current_user.admin? ? :approved : :pending

    if @poi.save
      redirect_to @poi, notice: "Ponto de interesse criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pois/1
  def update
    respond_to do |format|
      if @poi.update(poi_params)
        format.html { redirect_to @poi, notice: "Poi was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @poi }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @poi.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /pois/1
  def destroy
    @poi.destroy!

    respond_to do |format|
      format.html { redirect_to pois_path, notice: "Poi was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_poi
    @poi = Poi.find(params[:id])
  end

  def require_login
    unless logged_in?
      redirect_to login_path, alert: "Você precisa fazer login para continuar."
    end
  end

  def poi_params
    params.require(:poi).permit(:name, :description, :address, :latitude, :longitude, :cover_image, category_ids: [])
  end
end