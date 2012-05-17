require 'test_helper'

class GrupoTest < ActiveSupport::TestCase
  
  
  test "CRUD_grupo" do
    #Criando um novo registro
    grupo = Grupo.new
    grupo.descricao = 'arranjos'
    
    #Salvando o registro
    assert(grupo.save, 'Erro ao salvar um novo grupo')
    
    #Vamos ter certeza que o registro esta lá
    assert_not_nil(Grupo.find_by_descricao("arranjos"), 'Não localizou o grupo Arranjos')
    
    #Alteramos o registro
    grupo.descricao = 'Arranjos'
    
    #Salvando o registro alterado
    assert(grupo.save, 'Erro ao salvar o grupo Arranjos')
    
    #Apagando o registro do BD
    assert(grupo.destroy, 'Erro ao apagar o grupo')
    
    #Vamos ter certeza de que o registro está lá
    assert_nil(Grupo.find_by_descricao("Arranjos"), 'O registro ainda existe')
  end  
  
end
