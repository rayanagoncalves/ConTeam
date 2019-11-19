class AutenticacaoController < ApplicationController
    def get_token
        data = {
            email: params[:email], 
            password: params[:password]
        }
        authentication_return = rest_api('127.0.0.1:5000/auth/login', :post, data)
        p "*"*100
        p authentication_return
        redirect_to action: :index
    end
end
