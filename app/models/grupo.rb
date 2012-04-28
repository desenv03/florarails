class Grupo < ActiveRecord::Base
  default_scope :order => 'id ASC'

  has_many :produto
end
