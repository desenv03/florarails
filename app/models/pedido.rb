class Pedido < ActiveRecord::Base

  has_many :itempedido
    belongs_to :cliente

end
