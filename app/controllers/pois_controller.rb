class PoisController < ApplicationController
  before_action :set_poi, only: %i[ show edit update destroy ]

  # GET /pois or /pois.json
  def index
    @pois = Poi.all

    if params[:query].present?
      @pois = @pois.where("name LIKE ? OR address LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end

    if params[:category].present?
      # Filtra pela categoria exata selecionada
      @pois = @pois.where(category: params[:category])
    end

    if params[:latitude].present? && params[:longitude].present?
      radius = params[:radius].present? ? params[:radius].to_f : 20
      @pois = @pois.near_location(params[:latitude], params[:longitude], radius)
    end
  end

  # GET /pois/1 or /pois/1.json
  def show
  end

  # GET /pois/new
  def new
    @poi = Poi.new
  end

  # GET /pois/1/edit
  def edit
  end

  # POST /pois or /pois.json
  def create
    @poi = Poi.new(poi_params)

    respond_to do |format|
      if @poi.save
        format.html { redirect_to @poi, notice: "Poi was successfully created." }
        format.json { render :show, status: :created, location: @poi }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @poi.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /pois/1 or /pois/1.json
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

  # DELETE /pois/1 or /pois/1.json
  def destroy
    @poi.destroy!

    respond_to do |format|
      format.html { redirect_to pois_path, notice: "Poi was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poi
      @poi = Poi.find(params[:id])
    end

    def poi_params
      params.require(:poi).permit(:name, :description, :category, :address, :latitude, :longitude, :cover_image)
    end
end
