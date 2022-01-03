class ConsultantsController < ApplicationController
include NicknameModule

  def index
    @consultants = Consultant.all
    @consultant_nicknames = create_nickname(@consultants)
  end

  def new
    @consultant = Consultant.new
  end

  def create
    Consultant.create!(consultant_params)
    redirect_to consultants_path
  end

  def edit
    @consultant = Consultant.find(params[:id])
  end

  def update
    @consultant = Consultant.find(params[:id])
    @consultant.update!(consultant_params)
    redirect_to consultants_path
  end

  def edit_email
    @consultant = Consultant.find(params[:id])
  end

  def update_email
    @id = params[:id]
    @consultant = Consultant.find(params[:id])
    @consultant.update!(consultant_email_params)
    redirect_to consultants_path
  end

  private

  def consultant_params
    params.require(:consultant).permit(:name, :email)
  end

  def consultant_email_params
    params.require(:consultant).permit(:email)
  end
end
