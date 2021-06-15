map = {
  "Ege" => "jvsc1"
}
user = IO.read( ".git/config" )[ /remote "origin".+?(Ege|jvsc1)/m , 1]

other_user = map[user]
`git remote add #{other_user} git://github.com/#{other_user}/moonlight.git`
`git fetch #{other_user}`
