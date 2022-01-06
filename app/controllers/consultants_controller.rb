class ConsultantsController < ApplicationController
include NicknameModule

  def index
    consultants = Consultant.all.select(:id, :name, :email).map{|consultant| 
      Hash[
        :id, consultant.id, 
        :name, consultant.name,
        :email, consultant.email,
        :nickname, "#{consultant.name}っち"
      ]
    }
    render json: consultants
  end

  def create
    Consultant.create!(consultant_params) ? (render json: :success) : (render json: :failed)
  end

  def update
    consultant = Consultant.find_by(id: params[:id])
    consultant.update!(consultant_params) ? (render json: :success) : (render json: :failed)
  end

  def update_email
    consultant = Consultant.find_by(id: params[:id])
    consultant.update!(consultant_email_params) ? (render json: :success) : (render json: :failed)
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
