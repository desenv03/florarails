class ImagemProduto < ActiveRecord::Migration
  def up
    #Nome do arquivo original
    add_column :produtos, :imagem_file_name, :string
    #tipo do arquivo que foi armazenado
    add_column :produtos, :imagem_content_type, :string
    #Tamanho do arquivo em bytes
    add_column :produtos, :imagem_file_size, :integer
    #data da última atualização
    add_column :produtos, :imagem_updated_at, :timestamp 
  end

  def down
    remove_column :produtos, :imagem_file_name
    remove_column :produtos, :imagem_content_type
    remove_column :produtos, :imagem_file_size
    remove_column :produtos, :imagem_updated_at
  end
  
end
