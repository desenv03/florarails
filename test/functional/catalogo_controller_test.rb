require 'test_helper'

class CatalogoControllerTest < ActionController::TestCase

  fixtures :produtos
  
  
  test "should get index" do
    get :index
    assert_response :success
  end


  test "mostrou_ursinho" do
    #carregamos o método detalhes passando como parametro
    #o ID do ursinho
    get :detalhes, :id => produtos(:ursinho).id
    assert_response :sucess
  end
  
  
end
