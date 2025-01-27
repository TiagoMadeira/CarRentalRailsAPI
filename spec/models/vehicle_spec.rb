require "rails_helper"


 RSpec.describe Vehicle, type: :model do
  fixtures :vehicles


  it "is valid with valid attributes and required" do
    expect(vehicles(:minimum_valid_vehicle)).to be_valid
  end

  it "is not valid with lenghty model" do
    expect(vehicles(:lengthy_model_vehicle)).to_not be_valid
  end
  it "is not valid with lenghty brand" do
    expect(vehicles(:lengthy_brand_vehicle)).to_not be_valid
  end
end
