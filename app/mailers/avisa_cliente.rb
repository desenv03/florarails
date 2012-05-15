class AvisaCliente < ActionMailer::Base
  default :from => "lftecnologia.2010@gmail.com"
  def email_cliente(ped)
    @pedido = ped
    cliente = @pedido.cliente
    mail(:to => "#{cliente.nome} <#{cliente.email}>",
         :subject => "Pedido número " + "#{@pedido.id}" + " confirmado com sucesso!")
  end
  
end
