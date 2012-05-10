#Novament carregamos a biblioteca SHA, pois iremos criptografar a senha digitada 
#para comparar com a senha do banco de dados
require 'digest/sha2'

class AcessosController < ApplicationController

  layout "catalogo"
  
    def login
      if request.get?
        session[:cliente_id] = nil
        session[:cliente_nome] =nil
        @cliente = Cliente.new
      else
        @cliente = Cliente.new(params[:cliente])
        dados =Cliente.find(:first, :conditions =>["email = ? and senha = ?",
                            @cliente.email, Digest::SHA256.hexadigest(@cliente.senha)])
          if dados
            session[:cliente_id] = dados.id
            session[:cliente_nome] = dados.nome
            redirect_to(:controller => :pedidos,
                        :action => :fechar_pedido)
          else
            flash[:erro] = "Dados inválidos! Faça um novo login"
          end
      end
    end
    
    
    def logout
      #Iremos definir nil(nulo) para os registros
      session[:cliente_id] = nil
      session[:cliente_nome] nil
      redirect_to(:controller => :acessos,
                  :action => :login)
    end
    
    
end
