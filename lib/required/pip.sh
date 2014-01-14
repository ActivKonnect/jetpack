# vim: fileencoding=utf-8 tw=100 noexpandtab ts=8 sw=8 ft=sh :

function install_pip {
	shout "Installing Pip dependencies"

	PIP_SRC="$CACHE_DIR/pip/src"

	mkdir -p "$PIP_SRC"

	pip install -r "$BUILD_DIR/requirements.txt" --exists-action=w --src="$PIP_SRC" | indent
}
