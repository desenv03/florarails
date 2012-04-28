require 'paperclip'

class Produto < ActiveRecord::Base

belongs_to :grupo


  def self.localizar_produto_para_venda
    find(:all, :order => "titulo",
         :conditions => ['validade >=?', Date.current])
  end


  def to_param
    require 'iconv'
    texto = Iconv.iconv("ASCII//IGNORE/TRANSLIT",
    "UTF-8", titulo).join.gsub(/[\s]+/i,
    '_').gsub(/[^a-z0-9\_]+/i,'').downcase
    "#{id}-#{texto}"
  end


  has_attached_file :imagem, 
                    :styles => {:grande => "800x600>",
                                :media => "200x150",
                                :pequena => "80x60",
                                :thumb => "40x30"}
  #Configuração do PaperClip
  #has_attached_file :imagem,
  #  :styles => {:grande => "800x600>",
  #              :media => "200x150",
  #              :pequena => "80x60",
  #              :thumb => "40x30"},
  #  :path => ":rails_root/images/:class/:id/:style_:basename.:extension",
  #  :url => "images/:class/:id/:style_:basename.:extension",
  #  :default_url => "images/sem_foto.gif"
    #nos parametros path e url estamos definindo que as imagens estarão dentro do 
    #diretório assets/images e que será criado um diretório com o nome da classe
    #no nosso exemplo produtos e seu respectivo id

  #já o default_url irá definir uma imagem que será exibida caso não haja imagem

  #obriga o usuário a escolher um arquivo
  validates_attachment_presence :imagem,
    :message => 'Imagem deve ser informada'

  #verifica se o tipo de arquivo está correto
  validates_attachment_content_type :imagem,
    :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/pjpeg'],
    :message => 'Tipo da imagem é inválido!'
    #Validações do modelo
    validates_presence_of :titulo, :descricao
    validates_numericality_of :preco
    validate :preco_deve_ser_no_minimo_um_centavo
    validates_uniqueness_of :titulo
  
  #Método protected indica que o acesso é apenas a objetos da classe e subclasse
  protected

  def preco_deve_ser_no_minimo_um_centavo
    errors.add(:preco, 'deve ser no mínimo 0.01') if preco.nil? || preco < 0.01
  end

end
