class Api::UsersController < ApplicationController

    def create
      user = User.new(
                      name: params[:name],    #colon comes after the name (name:) just because that is the javascript syntax
                      email: params[:email], 
                      password: params[:password],
                      password_confirmation: params[:password_confirmation]
                      )


      if user.save
        render json: {message: "User created successfully"}, status: :created
      else
        render json: {errors: user.errors.full_messages}, status: :bad_request
      end
    end
end
