class Menu
    def initialize 
        @menu = []
    end

    def add(dish)
        @menu << dish
    end

    def list
        raise "There are no dishes on the menu yet!" if @menu == []
        return @menu
    end

    def present_menu
        raise "There are no dishes on the menu yet!" if @menu == []
        list = []
        @menu.each { |item|
            list << "#{item.name}: #{item.price}"
        }
        return list
    end
end