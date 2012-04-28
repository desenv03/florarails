class AdicionaGrupoNoProduto < ActiveRecord::Migration
  def up
    add_column :produtos, :grupo_id, :integer,
    :null => false,
    :default => 1
    execute 'ALTER TABLE produtos ADD CONSTRAINT flo_fk_pro_gru' +
            ' FOREIGN KEY (grupo_id) REFERENCES grupos (id)' +
            ' ON UPDATE NO ACTION ON DELETE NO ACTION;'
  end

  def down
    execute 'ALTER TABLE produtos DROP CONSTRAINT flo_fk_pro_gru CASCADE;'
    remove_column :produtos, :grupo_id
  end
end
