# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/about-ssh
# ls ~/.ssh
# ssh-keygen -t ed25519 -C "<this os/machine unique auth note>"
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_ed25519
# cat ~/.ssh/id_ed25519.pub
#
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

# gh auth login     # choose ssh login, and verify it with browser because of easy
# ssh -T git@github.com
# nvim ~/.ssh/config
# Host github github.com
    #HostName github.com
    #User git
    #IdentityFile ~/.ssh/github
# https://gist.github.com/vikpe/34454d69fe03a9617f2b009cc3ba200b
# ssh-keyscan github.com >> ~/.ssh/known_hosts
