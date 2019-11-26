# read in a book and clean up whitespace and paras should wrap
def text(book_name)
  file = File.open(book_name)
  book = file.read
  book.strip!
  book.gsub!(/\n\S\n/, "\S")
  book
end

puts text('aBook.txt')
