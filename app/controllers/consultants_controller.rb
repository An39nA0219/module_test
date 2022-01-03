class ConsultantsController < ApplicationController
include NicknameModule

  def index
    @consultants = Consultant.all
    @consultant_nicknames = create_nickname(@consultants)
  end
end
