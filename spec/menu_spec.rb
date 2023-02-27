require 'menu'

RSpec.describe "the present_menu method" do
    it "with 3 example dishes" do
        menu = Menu.new
        food1 = double :food1, name: "Fries", price: "£3.50"
        food2 = double :food2, name: "Chicken wings", price: "£9.60"
        food3 = double :food3, name: "Seabass and Mash", price: "£19.00"
        menu.add(food1)
        menu.add(food2)
        menu.add(food3)
        expect(menu.present_menu).to eq ["Fries: £3.50", "Chicken wings: £9.60", "Seabass and Mash: £19.00"]
    end

    it "when nothing has been entered on the menu" do
        menu = Menu.new
        expect { menu.list }.to raise_error "There are no dishes on the menu yet!"
    end

    it "the list method" do
        menu = Menu.new
        food1 = double :food1, name: "Fries", price: "£3.50"
        food2 = double :food2, name: "Chicken wings", price: "£9.60"
        food3 = double :food3, name: "Seabass and Mash", price: "£19.00"
        menu.add(food1)
        menu.add(food2)
        menu.add(food3)
        expect(menu.list).to eq [food1, food2, food3]
    end

    it "when nothing has been entered on the menu" do
        menu = Menu.new
        expect { menu.present_menu }.to raise_error "There are no dishes on the menu yet!"
    end
end