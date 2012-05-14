# OpenURI é um wraper para uilizar http, https e ftp.
# Um wrapper permite que um objeto cliente utilize serviços de outros objetos
# com interfaces diferentes por meio de uma interface única.
  
class ClientesController < ApplicationController

  # Ao invés de utilizarmos o layout padrão, vamos definir outro layout
  layout "catalogo"

  def index
    @clientes = Cliente.find(:all)
  end
  
  
  def destroy
    @clientes = Cliente.find(params[:id])
    @cliente.destroy
    flash[:info] = "Cliente excluido com sucesso"
    redirect_to(clientes_path)
  end
      
  
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
        format.html {redirect_to @cliente, :notice => 'Seus dados foram salvos com sucesso!'}
        format.json { render :json => @cliente, :status => :created, :location => @cliente}
      else
        erros = @cliente.errors.full_messages.to_s
        flash[:erro] = 'Erro ao salvar o cliente!' + erros
        format.html{render :action => "new"}
        format.json { render :json => @cliente.errors, :status => :unprocessable_entity }
      end
    end
  end

end
