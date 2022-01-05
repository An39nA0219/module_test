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

  # モデルの一部のパラメータのアップデート
  # def edit_email
  #   @consultant = Consultant.find(params[:id])
  # end

  # def update_email
  #   @id = params[:id]
  #   @consultant = Consultant.find(params[:id])
  #   @consultant.update!(consultant_email_params)
  #   redirect_to consultants_path
  # end

  # モデルの一部＋他のパラメータのアップデート
  def edit_email
    @consultant = Consultant.find(params[:id])
  end

  def update_email
    @id = params[:id]
    @consultant = Consultant.find(params[:id])
    @consultant.update!(consultant_and_other_params)
    if params[:consultant][:sex] == "male"
      @consultant.name += "male" 
    elsif params[:consultant][:sex] == "female"
      @consultant.name += "female" 
    end
      @consultant.save!
    redirect_to consultants_path
  end

  private

  def consultant_params
    params.require(:consultant).permit(:name, :email)
  end

  def consultant_email_params
    params.require(:consultant).permit(:email)
  end

  def consultant_and_other_params
    params.require(:consultant).permit(:email, :sex)
  end
end
