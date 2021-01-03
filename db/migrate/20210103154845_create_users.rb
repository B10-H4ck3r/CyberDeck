class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :uname
      t.string :tel
      t.string :email
      t.string :bio
      t.string :job_title
      t.string :job_comp
      t.string :job_bio
      t.string :clg_degree
      t.string :clg_name

      t.timestamps
    end
  end
end
