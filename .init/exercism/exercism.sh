exercism_install() {
	extract="exercism-3.1.0-linux-x86_64.tar.gz"
	extracted="exercism"
	command="exercism"
	#path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
	path=$( cd $(dirname $0); pwd)
	echo $path "is the path of executed file"

	if [ -f $path/$extract ]; then
		rm -r $path/$extract
		echo $path/$extract" removed"
	fi

	wget -P $path "https://github.com/exercism/cli/releases/download/v3.1.0/exercism-3.1.0-linux-x86_64.tar.gz"
	tar xzvf $path/$extract -C $path
	#chmod +x $path/$extracted/bin/$command
  /$path/$extracted

	if [ -f /usr/bin/$command ]; then
		rm /usr/bin/$command
		echo "/usr/bin/"$command" removed"
	fi

  if ! [ -d /root/bin/ ]; then
    mkdir /root/bin/
    echo "created /root/bin/"
  fi

	ln -s $path/$command /root/bin/$command
}
exercism_install
