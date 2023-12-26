module UserHelper
  # check character
  def check_character(character)
    characters = %w[
      ryu
      ken
      honda
      sagat
      cammy
      chun-li
      bison
      vega
      guile
      zangief
      balrog
      blanka
      deejay
      dhalsim
      feilong
      thawk
    ]
    characters.include?(character)
  end
end
