class CreatePedidos < ActiveRecord::Migration
  
  def self.up
    create_table :pedidos do |t|
      t.date :emissao
      t.string :observacao, :limit =>50
      t.string :tipo_pagamento, :limit => 10
      t.integer :cliente_id, :null => false, :options => "CONSTRAINT flo_fk_ped_cli REFERENCES clientes(id)"
      t.timestamps
    end
  end
  
  
  def self.down
    drop_table :pedidos
  end
  
  
end
