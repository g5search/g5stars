class String
  # Extension of the string class to properly handle camel names
  def nameize
    if self.match(/ /)
      # If the name has a space in it, we gotta run the parts through the nameizer.
      name = self.split(' ').each { |part| part.nameize! }.join(' ')
      return name
    elsif self.match(/^[A-Z]/)
      # If they took the time to capitalize their name then let's just jump out.
      return self
    else
      # If there are no spaces and there is no prior
      # capitalization then let's downcase the whole thing.
      name = self.downcase
    end
    # Let's now assume that they were lazy...
    return case
    when name.match(/^mac/)
      name.gsub(/^mac/, "").capitalize.insert(0, "Mac")
    when name.match(/^mc/)
      name.gsub(/^mc/, "").capitalize.insert(0, "Mc")
    when name.match(/^o\'/)
      name.split("'").each{ |piece| piece.capitalize! }.join("'")
    else
      name.capitalize # name is a first name or it's not Irish then capitalize it.
    end
  end

  def nameize!
    replace nameize # BANG!
  end

end