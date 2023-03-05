require 'order'

RSpec.describe Order do  
    it 'asked for an order on an empty entry' do
        food = double :food
        menu = double :menu, list: food
        order = Order.new(menu)
        expect{ order.ordered }.to raise_error "You haven't ordered anything yet!"
      end

    it 'returns the dishes ordered from the menu' do
        @order.choose(@food1)
        @order.choose(@food2)
        @order.choose(@food3)
        expect(@order.ordered).to eq [@food1, @food2, @food3]
    end
end
