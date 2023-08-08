hack_install() {
  cd /root/temp
  gh repo clone ryanoasis/nerd-fonts
  cd nerd-fonts
  ./install.sh Hack
}
hack_install
