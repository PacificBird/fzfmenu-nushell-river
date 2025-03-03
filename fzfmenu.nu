let table = (^find /usr/share/applications -name '*.desktop' | 
    lines | 
    wrap path | 
    insert name { 
      |x| open $x.path | 
      if ($in | str contains 'NoDisplay=true') {"Name=null"} else {$in} | 
      lines |
      filter {|line| $line =~ 'Name='} | 
      first 1 | 
      get 0 | 
      split row '=' |
      get 1 
    } |
    where name != 'null' 
  )

let selection = ($'($table.name | sort)' | 
    (str replace --all ", " "\n" | 
     str replace --all -r "\\[|\\]" "" | 
    fzf --layout=reverse --header-first --no-info) 
  )

# if not using river, change `riverctl spawn` to your compositors spawn command
$table | where name == $selection | get path | get 0 | riverctl spawn $"dex ($in)"
