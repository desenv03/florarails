class PedidosController < ApplicationController

  #verificamos se o cliente está autenticado no site
  before_filter :cliente_autenticado?
  
  def fechar_pedido
    @pedido = Pedido.new
  end
  

end
