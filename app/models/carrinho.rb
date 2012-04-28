class Carrinho

  attr_reader :itens
  # Chamado attr_reader com um símbolo têm o efeito de criar
  # uma variável de instancia com o mesmo nome do símbolo


  def initialize
    @itens = []
  end


  def adiciona_produto(produto)
    item_atual = @itens.find {|item| item.produto == produto}
    
    if item_atual
      item_atual.aumenta_quantidade
    else
      @itens << ItemCarrinho.new(produto)
    end
    
  end


  def remove_produto(produto)
    @itens.delete_if {|item| item.produto == produto}
  end


  def preco_total
    @itens.sum {|item| item.preco}
  end


end
