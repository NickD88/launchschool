puts (<<-EOF)
  1) != is not equal to and it is used to return boolean values
  2) ! is used before turns any object into the boolean opposite
  3) ! is used after something like uniq! to indicate it mutates the caller
  4) ? before something is the tenary operator works for if else statements
      (ex: puts 1 < 2 ? "one is less then two" : "one is not less then two")
  5) ? after something is part of the ruby name and MAY indicate it is asking a question
      (ex include? 'does it include')
  6) !! before an opject turns it into boolean quiivalent
  EOF
