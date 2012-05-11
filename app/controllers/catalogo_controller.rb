class CatalogoController < ApplicationController

  def index
    @produtos= Produto.localizar_produto_para_venda 
  end


  def detalhes
    @produto = Produto.find(params[:id].to_i)
    rescue ActiveRecord::RecordNotFound
    flash[:info] = "O produto não foi encontrado. Por favor, selecione outro em nosso catalogo"
      redirect_to :action => :index
  end

  
  def adicionar_no_carrinho
		begin
		
			produto = Produto.find(params[:id])

		rescue ActiveRecord::RecordNotFound
   		logger.error("ERRO: Nao eh possivel localizar o produto #{params[:id]}" )
			flash[:erro] = "O produto informado nao existe. Por favor selecione outro em nosso catalogo"
			redirect_to :action => :index
		else
			@carrinho = localiza_carrinho
			@carrinho.adiciona_produto(produto)
			
		end
	end


  def esvaziar_carrinho
    session[:carrinho] = nil
    flash[:info] = "O seu carrinho agora está vazio!"
    redirect_to :action => :index
  end


  def remover_do_carrinho
    produto = Produto.find(params[:id].to_i)
      @carrinho = localiza_carrinho
      @carrinho.remove_produto(produto)
      render :action => :adicionar_no_carrinho
  end

  
  autocomplete :produto, :titulo
  #Método para efetuar a busca de um produto
#  def procurar
#    autocomplete :produto, :titulo
#    @termo = params[:busca].downcase
#    @produtos = Produto.find(:all, :conditions => ["LOWER(descricao)
#      LIKE ? or LOWER(titulo) LIKE ? and validade >=?", '%'+@termo+'%','%'+@termo+'%',
#      Date.current ],:order => 'validade ASC')
#    unless @produto && @produto.size > 0
#      flash.now[:info] = "Não foi encontrado nenhum produto com esse críterio de busca"
#    end
#    @carrinho = localiza_carrinho
#  end


  def lista_itens_grupo
    @produtos = Produto.lista_produto_grupo(params[:grupo])
    @grupo = Grupo.find(params[:grupo])
  end
  
  
  def salva_pedido
    @carrinho = localiza_carrinho
    @pedido = Pedido.new(params[:pedido])
    @pedido.adiciona_item_carrinho(@carrinho)
    if @pedido.save
      session[:carrinho] = nil
      flash[:info] = "Sua compra foi finalizada! O número do seu pedido é " + 
                      @pedido.id.to_s
      redirect_to(:controller => :catalogo, :action => :index)
    else
      render :action => :fechar_pedido
    end
  end
  
  
  # private significa que o método é acessivel somente
  # quando chamado com um receptor especifico
  private
    def localiza_carrinho
      session[:carrinho] ||= Carrinho.new
    end
  # session[:carrinho] ||= Carrinho.new: caso possua um valor
  # correspondente a chave carrinho, o valor é retornado, senão
  # uma nova instancia de carrinho é criada e então retornada.
  

  
  
end
