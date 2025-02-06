require "rails_helper"

RSpec.describe Rental, type: :model do
  fixtures :users, :vehicles, :rentals, :blocked_dates
  context "#rental state is correctly defined" do
    it "should return upcoming" do
      expect(rentals(:upcoming_valid_rental).rental_state).to equal(:upcoming)
    end
    it "should return ongoing" do
      expect(rentals(:ongoing_valid_rental).rental_state).to equal(:ongoing)
    end
    it "should return concluded" do
      expect(rentals(:concluded_valid_rental).rental_state).to equal(:concluded)
    end
    it "should return canceled" do
      expect(rentals(:canceled_valid_rental).rental_state).to equal(:canceled)
    end
  end

  context "#rental cancel" do
    it "should ongoing rental should not be cancelable" do
      expect(rentals(:ongoing_valid_rental).cancelable?).to be false
    end
    it "should concluded rental should not be cancelable" do
      expect(rentals(:concluded_valid_rental).cancelable?).to be false
    end
    it "should canceled rental should not be cancelable" do
      expect(rentals(:canceled_valid_rental).cancelable?).to be false
    end
    it "should upcoming rental should be cancelable" do
      expect(rentals(:upcoming_valid_rental).cancelable?).to be true
    end
  end

  it "should calculate cost correctly" do
    expect(rentals(:upcoming_valid_rental).total_rental_cost).to eq(BigDecimal("20"))
  end
end
