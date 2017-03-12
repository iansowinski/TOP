class Book
# write your code here
  attr_reader :title
  def title= title
    @title = capitalize(title)
  end

  private

  def capitalize(title)
    title = title.split(' ')
    title_new = []
    forbidden = ["a", "an", "the", "and", "of", "in"]
    title.each do |i|
      forbidden.each do |j|
        if j == i and title_new.length != 0
          title_new << i
        end
      end
      if i != title_new[-1] or title_new.length == 0
        title_new << i[0].upcase + i[1..-1]
      end
    end
    return title_new.join(" ")
  end
end
