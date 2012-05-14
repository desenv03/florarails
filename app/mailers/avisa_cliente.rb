class AvisaCliente < ActionMailer::Base
  #default :from => "from@example.com"
  def email_cliente(pedido)
    recipients "#{pedido.cliente.email}"
    from "vendas@florarails.com.br"
    subject "Pedido nr" + "#{pedido.id}" + " confirmado com sucesso!"
    body "pedido" => pedido
  end
  
end
