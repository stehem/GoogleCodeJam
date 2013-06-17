class Language

  def initialize(language)
    @language = language
  end

  def zero
    @zero ||= @language.split("")[0][0]
  end

  def language
    @language
  end

  def length
    @length ||= @language.split("").length
  end

  def five
    @five ||= language.split("")[(length/2).to_i]
  end

end


