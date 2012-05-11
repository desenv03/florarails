class Itempedido < ActiveRecord::Base

  belongs_to :pedido
  belongs_to :produto
  
  
  def self.busca_item_carrinho(itemcarrinho)
    item = self.new
    item.produto = itemcarrinho.produto
    item.quantidade = itemcarrinho.quantidade
    item.valor = itemcarrinho.preco
    item
  end
  
  
end
