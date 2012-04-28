class GruposController < ApplicationController
  def index
    @grupos = Grupo.find(:all)
  end
  
  def show
    @grupo = Grupo.find(params[:id])
  end

  #instancia um novo objeto
  def new
    @grupo = Grupo.new
  end

  #recebe os parametros do formulario, grava no banco de dados
  #exie uma mensagem para o usuário
  def create 
    @grupo = Grupo.new(params[:grupo])
    if @grupo.save
      flash[:aviso] = 'Grupo salvo com sucesso!'
    else
      flash[:erro] = 'Erro ao salvar o grupo'
    end  
      redirect_to(@grupo)
  end

  #traz os dados do formulário
  def edit
    @grupo = Grupo.find(params[:id])
  end

  #grava efetivamente as alterações no banco de dados 
  def update
    @grupo = Grupo.find(params[:id]) 
    if @grupo.update_attributes(params[:grupo])
      flash[:aviso] = 'Grupo atualizado com sucesso.'
      redirect_to(@grupo)
    end
  end

  #deleta um registro
  def destroy
    @grupo = Grupo.find(params[:id])
    @grupo.destroy
    flash[:info] = "Grupo excluido com sucesso!"
    redirect_to(grupos_path)
  end

end
