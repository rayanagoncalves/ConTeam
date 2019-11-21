class AuthenticationController < ApplicationController
    before_action :authorize_request, except: [:login, :check]

    # POST /auth/login
    def login
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
            token = JsonWebToken.encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            session[:token] = token
            render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                            email: @user.email }, status: :ok
        else
            render json: { error: 'unauthorized' }, status: :unauthorized
        end
    end

    def check
        token = params[:token]
        if token != ''
            token = JsonWebToken.decode(token)
            p token
            @user = User.find(token[:user_id])
            p @user
        #    p params[:token]
            if @user
                render json: { status: 'ok' }, status: :ok
            else 
                render json: { error: 'unauthorized' }, status: :unauthorized 
            end
        else 
            render json: { error: 'unauthorized' }, status: :unauthorized  
        end
    end

    private

    def login_params
        params.permit(:email, :password)
    end
end
