# set git prompt flags
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showcolorhints 1
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_showdirtystate 1

# set pwd flags
set -g fish_prompt_pwd_dir_length 0

# enable vi mode
set -g fish_key_bindings fish_vi_key_bindings

function fish_prompt
  # whoami pwd git-branch git-status
  echo (set_color 'blue')(whoami) (set_color 'yellow')(prompt_pwd) (set_color 'normal')(fish_git_prompt)
  echo (set_color 'red')"\$ "(set_color 'normal')
end

function fish_right_prompt
  set theDate (date '+%d-%m-%Y %H:%M:%S')
  echo '['$theDate']'
end
