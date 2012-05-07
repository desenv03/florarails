class CreateClientes < ActiveRecord::Migration


  def self.up
    create_table :clientes do |t|
      t.string :cep, :limit => 8
      t.string :nome, :limit => 60, :null => false
      t.string :telefone, :limit => 13
      t.string :cidade, :limit => 60
      t.string :uf, :limit => 2
      t.string :tipo_logradouro, :limit => 20 
      t.string :logradouro, :limit => 100
      t.string :complemento, :limit => 20
      t.string :bairro, :limit => 60
      t.string :email, :limit => 60, :null => false
      t.string :senha, :limit => 100, :null => false
      t.string :cpf, :limit => 14, :null => false

      t.timestamps
    end


    #Criando uma unique key para o cpf
    add_index :clientes, :cpf, :unique => true
  end


  def self.down
    drop_table :clientes
  end

  
end
