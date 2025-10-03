function pretty_path
  echo (pwd | sed "s|^$HOME|~|g")
end

set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showcolorhints 1
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_showdirtystate 1

function fish_prompt
  # whoami pwd git-branch git-status
  echo (set_color 'blue')(whoami) (set_color 'yellow')(pretty_path) (set_color 'normal')(fish_git_prompt)
  echo (set_color 'red')"\$ "(set_color 'normal')
end

function fish_right_prompt
  set theDate (date '+%d-%m-%Y %H:%M:%S')
  echo '['$theDate']'
end
