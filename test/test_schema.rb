silence_stream(STDOUT) do

  ActiveRecord::Schema.define do

    create_table :typus_users, :force => true do |t|
      t.string :email, :first_name, :last_name
      t.string :salt, :crypted_password
      t.boolean :status, :default => false
      t.string :roles
      t.timestamps
    end

    create_table :tags, :force => true do |t|
      t.string :name
    end

    create_table :users, :force => true do |t|
      t.string :first_name, :last_name, :email
    end

    create_table :posts, :force => true do |t|
      t.string :title
      t.text :body
      t.boolean :status
      t.timestamps
      t.integer :user_id
    end

    add_index :posts, :user_id

    create_table :categories, :force => true do |t|
      t.string :name
      t.string :permalink
      t.text :description
      t.integer :position
    end

    create_table :categories_posts, :force => true, :id => false do |t|
      t.column :category_id, :integer
      t.column :post_id, :integer
    end

    add_index :categories_posts, :category_id
    add_index :categories_posts, :post_id

    create_table :posts_tags, :force => true, :id => false do |t|
      t.column :post_id, :integer
      t.column :tag_id, :integer
    end

    add_index :posts_tags, :post_id
    add_index :posts_tags, :tag_id

    create_table :comments, :force => true do |t|
      t.string :email, :name
      t.text :body
      t.integer :post_id
    end

    add_index :comments, :post_id

  end

end