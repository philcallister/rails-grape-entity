# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  todo_id     :integer
#  description :string(255)
#  complete    :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

class Item < ActiveRecord::Base
  belongs_to :todo
end
