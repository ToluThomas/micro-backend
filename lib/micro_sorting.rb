# frozen_string_literal: true

# Micro Sorting Formatter
class MicroSorting
    def initialize
        # Initialise total price and names array for later use
        @totalPrice = 0
        @names = []
    end

    # Get total price
    def totalPrice(orders) # Sum prices for each ticket
        orders.each do |order|
            order["tickets"].each do |ticket|
                # Add price of each ticket to the total price
                @totalPrice+=ticket["price"]
            end
        end
        # Return total price to 2 decimal places
        '%.2f' % @totalPrice
    end

    def priceToGermanCurrency(totalPrice)
        # Convert total price to string and replace "." with ","
        # Then return result (German currency)
        totalPrice.to_s.tr(".", ",")
    end

    # Get names
    def names(orders)
        # For each order push order name into @names array
        orders.each do |order|
            @names.push(order["name"])
        end
        # Return the new array of names
        @names
    end

    def sortNames(names)
        # sortNames array alphabetically in ascending order and delimit result with ", "
        names.sort.join(', ')
    end
end