# vim: fileencoding=utf-8 tw=100 noexpandtab ts=8 sw=8 ft=sh :

function install_pip {
	shout "Installing Pip dependencies"

	echo "Installing pip" | indent
	curl -s https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python | indent

	echo "Installing dependencies" | indent
	PIP_SRC="$CACHE_DIR/pip/src"
	mkdir -p "$PIP_SRC"
	pip install -r "$BUILD_DIR/requirements.txt" --exists-action=w --src="$PIP_SRC" | indent
}
