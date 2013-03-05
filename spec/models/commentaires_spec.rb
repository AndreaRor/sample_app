# == Schema Information
#
# Table name: commentaires
#
#  id           :integer          not null, primary key
#  contenu      :string(255)
#  user_id      :integer
#  micropost_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Commentaires do
  pending "add some examples to (or delete) #{__FILE__}"
end
