class Pedido < ActiveRecord::Base

  has_many :itempedido
    belongs_to :cliente
    
  TIPOS_PAGAMENTO = [
    [ "Boleto", "bo"],
    [ "Cartão de Crédito", "cc"],
    [ "Tranferência Bancária", "tb"]
  ]


  def adiciona_item_carrinho(carrinho)
    carrinho.itens.each do |item|
      item = Itempedido.busca_item_carrinho(item)
      itempedido << item
    end
  end
  
  
end
