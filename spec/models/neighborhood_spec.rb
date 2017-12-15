require 'rails_helper'

RSpec.describe Neighborhood, type: :model do
  it { should have_many(:parks).dependent(:destroy) }

  it { should validate_presence_of(:name)}
end
