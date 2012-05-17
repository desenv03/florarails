require 'test_helper'

class ProdutoTest < ActiveSupport::TestCase
  
  
  test "numero_registros" do
    assert_equal(2, Produto.count, "numero de registros em produto 'invalido")
  end
  
  
  test "dados_ursinho" do
    assert_equal(produtos(:ursinho).attributes['titulo'], 'Urso Tedy', "o tutulo e invalido")
  end
  
  
  test "novo_produto_certo" do
    produto = Produto.create(:titulo => "Rosa",
                             :descricao => "Rosa branca",
                             #:imagem => "rosa.jpg",
                             :preco => 14.99,
                             :validade => "2012-12-31",
                             :grupo_id => 1)
    assert produto.valid?, "nao gravou um novo produto"
  end
  
  
  test "novo_produto_errado" do
    produto = Produto.create(:titulo => nil,
                             :descricao => nil)
    # A exclamação antes do produto significa negação
    assert !produto.valid?, "gravou o produto errado"
  end
  
  
end
