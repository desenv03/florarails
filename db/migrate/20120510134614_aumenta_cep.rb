class AumentaCep < ActiveRecord::Migration
  def up
    execute "alter table clientes alter column cep type varchar(9);"
  end

  def down
  end
end
