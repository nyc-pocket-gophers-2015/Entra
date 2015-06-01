class ClientsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def show

  end

  def new
    @client = Client.new
    respond_to do |format|
      if request.xhr?
        format.html { render :new, layout: false}
      else
        format.html { render :new }
      end
    end
  end

  def create
    new_client = Client.new(get_params)
    new_client.user_id  = current_user.id
    if new_client.save
      flash[:success] = "#{new_client.name} was saved"
      redirect_to user_path(current_user)
    else
      flash[:error] = "This client could not be saved"
      redirect_to :back #ask about changing this
    end
  end

  def update

  end

  def delete

  end

  private

  def get_params
    params.require(:client).permit(:name, :phone, :email)
  end

end
