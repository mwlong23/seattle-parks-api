require 'rails_helper'

RSpec.describe Park, type: :model do

it { should belong_to(:neighborhood)}

it { should validate_presence_of(:name) }
it { should validate_presence_of(:description) }
it { should validate_presence_of(:address) }

it { should validate_presence_of(:latitude) }
it { should validate_presence_of(:longitude) }


end
