class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :titulo
      t.text :descricao
      t.decimal :preco
      t.date :validade

      t.timestamps
    end
  end
end
