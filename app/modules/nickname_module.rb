module NicknameModule
  def create_nickname(persons)
    persons.map{|person| person.name + "っち"}
  end
end