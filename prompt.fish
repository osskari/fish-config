function pretty_path
  echo (pwd | sed "s|^$HOME|~|g")
end

function git_status
  if test (git status --untracked-files=yes --porcelain 2> /dev/null | wc -l) -eq 0
    set gitColor 'green'
  else
    set gitColor 'red'
  end

  set branchName (git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if test "$branchName" != ""
    echo (set_color $gitColor)$branchName
  end
end

function fish_prompt
  # whoami pwd git-branch git-status
  echo (set_color 'blue')(whoami) (set_color 'yellow')(pretty_path) (git_status)
  echo (set_color red)"\$ "(set_color normal)
end

function fish_right_prompt
  set theDate (date '+%d-%m-%Y %H:%M:%S')
  echo '['$theDate']'
end
