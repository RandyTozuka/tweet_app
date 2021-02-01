class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      # t.references により、userではなくuser_idというカラム名を作成してくれ、インデックスを自動で張ってくれる
      # https://qiita.com/ryouzi/items/2682e7e8a86fd2b1ae47
      t.references :tweet, foreign_key: true
      t.timestamps
    end
  end
end
