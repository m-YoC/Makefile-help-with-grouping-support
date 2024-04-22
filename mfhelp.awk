# Regular expression for grep -E option
# (^[a-zA-Z_-]+:.*?## .*$|^###>( .+)?$)

BEGIN {
  cmdw=20

  FS="(:.*?## |#> ?)"
  gr="f"
  gray="\033[30m"
  cyan="\033[36m"
  clear="\033[0m"

  group_color=gray
  cmd_color=cyan
}
{
  if($1 == "##") {
    if($2 ~ "^ *$") { 
      gr="f"
      printf ("\n")
    } else if($2 ~ "^@") {
      gr="f"
    } else {
      gr="t" 
      printf (group_color "%s" clear "\n", $2)
    }
  } else {
    if(gr == "t") {
      printf (group_color "\\_ " cmd_color "%-" (cmdw-3) "s" clear " %s\n", $1, $2)
    } else {
      printf (cmd_color "%-" cmdw "s" clear " %s\n", $1, $2)
    }
  }
}
