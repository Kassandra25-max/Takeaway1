require 'dish'

RSpec.describe Dish do
    context "is ready to take input" do
        it "returns the dish name the user provided" do
            dish = Dish.new("Fries", "£3.50")
            expect(dish.name).to eq "Fries"
        end

        it 'returns the dish price' do
            dish = Dish.new("food", "£5.00")
            expect(dish.price).to eq "£5.00"
        end       
    end
end

