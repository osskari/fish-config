fish_config_dir="$HOME/.config/fish/conf.d"

if [ ! -d "$fish_config_dir" ]; then
  echo "Could not find fish config"
  exit -1
fi

for file in src/*.fish; do
  file_path=$(realpath $file)
  link_path="$fish_config_dir/$(basename $file)"

  if [ ! -e $link_path ]; then
    echo "creating link: $file_path -> $link_path"
    ln -s $file_path $link_path
  else
    echo "file already exists: $link_path"
  fi
done
