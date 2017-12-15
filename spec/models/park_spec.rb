require 'rails_helper'

RSpec.describe Park, type: :model do

it { should validate_presence_of(:name) }
it { should validate_presence_of(:description) }
it { should validate_presence_of(:address) }
it { should validate_presence_of(:bathroom) }
it { should validate_presence_of(:drinking_fountain) }
it { should validate_presence_of(:dog_park) }
it { should validate_presence_of(:playground) }
it { should validate_presence_of(:latitude) }


end
