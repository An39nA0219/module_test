class ConsultantsController < ApplicationController
  def index
    @consultants = Consultant.all
    @consultant_nicknames = @consultants.map{|consultant| consultant.name + "っち"}
  end
end
