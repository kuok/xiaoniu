class PushTypesController < ApplicationController
  before_action :set_push_type, only: [:show, :edit, :update, :destroy]

  # GET /push_types
  # GET /push_types.json
  def index
    @push_types = PushType.all
  end

  # GET /push_types/1
  # GET /push_types/1.json
  def show
  end

  # GET /push_types/new
  def new
    @push_type = PushType.new
  end

  # GET /push_types/1/edit
  def edit
  end

  # POST /push_types
  # POST /push_types.json
  def create
    @push_type = PushType.new(push_type_params)

    respond_to do |format|
      if @push_type.save
        format.html { redirect_to @push_type, notice: 'Push type was successfully created.' }
        format.json { render :show, status: :created, location: @push_type }
      else
        format.html { render :new }
        format.json { render json: @push_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /push_types/1
  # PATCH/PUT /push_types/1.json
  def update
    respond_to do |format|
      if @push_type.update(push_type_params)
        format.html { redirect_to @push_type, notice: 'Push type was successfully updated.' }
        format.json { render :show, status: :ok, location: @push_type }
      else
        format.html { render :edit }
        format.json { render json: @push_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /push_types/1
  # DELETE /push_types/1.json
  def destroy
    @push_type.destroy
    respond_to do |format|
      format.html { redirect_to push_types_url, notice: 'Push type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_push_type
      @push_type = PushType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def push_type_params
      params.require(:push_type).permit(:name)
    end
end
