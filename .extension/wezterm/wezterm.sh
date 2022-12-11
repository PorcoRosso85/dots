wezterm_install() {
  app="WezTerm-20221119-145034-49b9839f-Ubuntu18.04.AppImage"
  command="wezterm"
  path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
  echo $path
  if [ -f $path/$app ]; then
    rm -r $path/$app
    echo $app" removed"
  fi
  if [ -f /usr/bin/$command ]; then
	  rm /usr/bin/$command
	  echo "/usr/bin/"$command" removed"
  fi
  curl -o $path/$app -LO "https://github.com/wez/wezterm/releases/download/20221119-145034-49b9839f/"$app
  chmod +x $path/$app
	ln -s $path/$app /usr/bin/$command
}
wezterm_install

try() {
  app="WezTerm-20221119-145034-49b9839f-Ubuntu18.04.AppImage"
  command="wezterm"
  path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
  if [ -f /usr/bin/$command ]; then
	  rm /usr/bin/$command
	  echo "/usr/bin/"$command" removed"
  fi
}
#try
