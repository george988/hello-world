require 'csv'
class BookInStock
  attr_reader :isbn, :price
  attr_accessor :isbn, :price
  def initialize(isbn,price)
    @isbn=isbn
    @price=Float(price)
  end
  
  def price_in_cents
    Integer(price*100+0.5)
  end
  
  def price_in_cents=(cents)
    @price =cents/100.0
  end

end

class CsvReader
  def initialize
    @books_in_stock=[]
  end
  def read_in_csv_data(csv_file_name)
    CSV.foreach(csv_file_name, headers: true) do | row|
      @books_in_stock << BookInStock.new(row["ISBN"],row["Amount"])
    end
    p @books_in_stock
  end
  
  def total_value_in_stock
    sum=0.0
    @books_in_stock.each do | book | 
        sum+=book.price
    end
    sum
  end
end

