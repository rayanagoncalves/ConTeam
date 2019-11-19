class ContainersController < ApplicationController
    before_action :set_container, only: [:edit, :show]
    def index
        @containers = rest_api('containers', :get)
    end

    def new
    end

    def edit
    end

    def cadastro
    end

    def create
        data = {
            container: {
                name: params[:name],
                container_name: Time.now.to_i,
                image: params[:image]
            }
        }
        rest_api('containers', :post, data)
        redirect_to action: :index
    end

    def update
        data = {
            container: {
                name: params[:name]
            }
        }
        id = params[:id]
        rest_api("containers/#{id}", :put, data)
        redirect_to action: :index
    end

    def show
    end

    def destroy
        id = params[:id]
        rest_api("containers/#{id}", :delete)
        redirect_to action: :index
    end

    private
    def set_container
        id = params[:id]
        @container = rest_api("containers/#{id}", :get)
    end
end
