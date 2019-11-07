#!/usr/bin/env bash

# Enable debug if argument passed to script
if [[ "${1}" =~ debug ]]; then
	set -x
fi

# Check for dependencies
DEPS=""
type git &>/dev/null || DEPS="  git\n"
type vim &>/dev/null || DEPS+="  vim\n"
type wget &>/dev/null || DEPS+="  wget\n"

if [[ -n "${DEPS}" ]] ; then
	echo "Please install missing dependencies:"
	echo -e "${DEPS}"
	exit 1
fi

# Fail the whole script if one part fails
set -eo pipefail
finish() {
	# shellcheck disable=SC2181
	if [[ $? -ne 0 ]]; then
		set +x
		echo -e "\nSorry, something went wrong. Try running with debug, i.e.:"
		echo -e "  ${0} --debug\n"
	fi
}
trap finish EXIT

# Directory containing the script, so that we can copy other files out
#DIR="$(dirname "$(readlink -f "${0}")")" # not supported on OSX
DIR="$( cd "$( dirname "${0}" )" && pwd )"

# Get Vundle, the vim bundler
mkdir -p "${HOME}/.vim/bundle/"
if [[ -d "${HOME}/.vim/bundle/vundle/.git" ]]; then
	( cd "${HOME}/.vim/bundle/vundle"
	echo "Pulling vundle updates from GitHub"
	git remote update &>/dev/null
	git reset --hard origin/master &>/dev/null
	cd - >/dev/null )
else
	echo "Cloning vundle from GitHub"
	git clone https://github.com/gmarik/vundle.git "${HOME}/.vim/bundle/vundle" &>/dev/null
fi

# Put our vimrc in place
echo "Installing vimrc config"
cp "${DIR}/vimrc" "${HOME}/.vimrc"

# Copy the example local files if not already existing
for config in vimrc.local vimrc.local.vundles vimrc.local.vundles.disable; do
	if [[ ! -e "${HOME}/.${config}" ]]; then
		cp "${DIR}/${config}" "${HOME}/.${config}"
	fi
done

# Grab hack font if it doesn't exist
if [[ ! "$(fc-list |grep Hack-)" ]]; then
	( mkdir -p "${HOME}/.fonts/"
	cd "${HOME}/.fonts/"
	echo "Downloading Hack font"
	wget -q https://github.com/source-foundry/Hack/releases/download\
/v3.000/Hack-v3.000-ttf.zip \
-O hack.zip
	unzip -qu hack.zip && rm -f hack.zip
	cd - >/dev/null
	# Update fonts
	fc-cache -f "${HOME}/.fonts" )
fi

# Install all the bundles specified in .vimrc
vim +PluginInstall +qall

# Vim detects mutt emails (with filetype plugin on) so set wrapping
mkdir -p ~/.vim/ftplugin
cat > ~/.vim/ftplugin/mail.vim << EOF
setl tw=62
setl fo+=aw
EOF

# Advise user of overrides
cat << EOF
All done!

* You can put custom settings in ~/.vimrc.local
* Add your own vim bundles to ~/.vimrc.local.vundles
* Disable vim bundles with ~/.vimrc.local.vundles.disable

EOF
