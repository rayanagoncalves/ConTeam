class ContainersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_container, only: [:show, :update, :destroy]

  # GET /containers
  def index
    @containers = Container.all

    render json: @containers
  end

  # GET /containers/1
  def show
    render json: @container
  end

  def stop
    @container = Container.find(params[:id])
    system "docker stop #{@container.container_name}"
  end

  def start
    @container = Container.find(params[:id])
    system "docker start #{@container.container_name}"
  end

  # POST /containers
  def create
    @container = Container.new(container_params)

    if @container.save
      container_name = container_params[:container_name]
      container_image = container_params[:image]
      system "docker create --name=#{container_name} #{container_image}"
      system "docker start #{container_name}"
      render json: @container, status: :created, location: @container
    else
      render json: @container.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /containers/1
  def update
    if @container.update(container_params)
      render json: @container
    else
      render json: @container.errors, status: :unprocessable_entity
    end
  end

  # DELETE /containers/1
  def destroy
    container_name = @container.container_name
    @container.destroy
    system "docker stop #{container_name}"
    system "docker rm #{container_name}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_container
      @container = Container.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def container_params
      params.require(:container).permit(:name, :container_name, :image)
    end
end
