# OpenURI é um wraper para uilizar http, https e ftp.
# Um wrapper permite que um objeto cliente utilize serviços de outros objetos
# com interfaces diferentes por meio de uma interface única.
  require 'open-uri'
  
class ClientesController < ApplicationController

  # Ao invés de utilizarmos o layout padrão, vamos definir outro layout
  layout "catalogo"

  def show
    @cliente = Cliente.find(params[:id])
  end

  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(params[:cliente])
    respond_to do |format|
      if @cliente.save
      flash[:aviso] = 'Seus dados foram salvos!'
      format.html {redirect_to(@cliente)}
      else
        format.html{render :action => "new"}
      end
    end
  end

  def buscar_cep
    #Chama o 

    
end
