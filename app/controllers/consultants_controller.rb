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

  private

  def consultant_params
    params.require(:consultant).permit(:name, :email)
  end
end
