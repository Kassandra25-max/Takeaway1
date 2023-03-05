class Order
    def initialize(menu)
        @menu = menu
        @ordered = []
    end

    #I have defined the choose method however I keep getting an error of not defining the method in the class - I AM SAD!
    def choose(dish)
        @ordered << dish if @menu.list.include?(dish)
    end

    def ordered
        raise "You haven't ordered anything yet!" if @ordered == []
        return @ordered
    end

    def total 
        pounds = 0 
        pence = 0
        @ordered.each { |item|
            item = item.price.delete("£").split(".")
            pounds += item[0].to_i
            pence += item[1].to_i
            pounds = pounds += pence/100.floor
            pence = pence % 100
        }
        return "£#{pounds}.#{pence}"
    end
end

