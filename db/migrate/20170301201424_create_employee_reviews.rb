class CreateEmployeeReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_reviews do |t|

      t.timestamps
    end
  end
end
