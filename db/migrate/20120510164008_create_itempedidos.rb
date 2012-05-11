class CreateItempedidos < ActiveRecord::Migration

  def self.up
    create_table :itempedidos do |t|
      t.integer :produto_id, :null => false, :options => "CONSTRAINT flo_fk_ite_pro REFERENCES produtos(id)"
      t.integer :pedido_id, :null => false, :options => "CONSTRAINT flo_fk_ite_ped REFERENCES pedidos(id)"
      t.integer :quantidade, :null => false
      t.decimal :valor, :null => false, :precision => 8, :scale => 2
      t.timestamps
    end
  end
  
  
  def self.down
    drop_table :itempedidos
  end
  
end
