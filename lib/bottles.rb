class Bottles
  def song
    verses(99, 0)
  end

  def verse(n)
    n > 0 ? _normal_verse(n) : _final_verse
  end

  def verses(starting_bottle_count, ending_bottle_count)
    starting_bottle_count.downto(ending_bottle_count).map { |n| verse(n) }.join("\n")
  end

  private

  def _normal_verse(n)
    <<~DOC
    #{_pluralize_bottle(n)} of beer on the wall, #{_pluralize_bottle(n)} of beer.
    Take #{_it_or_one(n)} down and pass it around, #{_pluralize_bottle(n - 1)} of beer on the wall.
    DOC
  end

  def _final_verse
    <<~DOC
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    DOC
  end

  def _pluralize_bottle(n)
    if n > 1
      "#{n} bottles"
    elsif n == 1
      "#{n} bottle"
    else
      "no more bottles"
    end
  end

  def _it_or_one(n)
    n == 1 ? "it" : "one"
  end
end
