class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    # @type [ActiveModel::SecurePassword::InstanceMethodsOnActivation]
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: 'Invalid user/password combination'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_index_url, notice: 'Logged out'
  end
end
