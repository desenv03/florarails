# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

def create_grupos
    Grupo.create(:descricao => 'Cestas') if !Grupo.where(:descricao => 'Cestas').first
    Grupo.create(:descricao => 'Bouquets') if !Grupo.where(:descricao => 'Bouquets').first
    Grupo.create(:descricao => 'Arranjos') if !Grupo.where(:descricao => 'Arranjos').first
end

create_grupos
