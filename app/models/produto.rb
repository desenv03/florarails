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

  def self.lista_produto_grupo(grupo)
    find(:all, :order => "titulo",
         :conditions => ['validade >= ? and grupo_id = ?', Date.current, grupo])
  end

  
end
