# vim: fileencoding=utf-8 tw=100 noexpandtab ts=8 sw=8 ft=sh :

function require {
	package=$1
	arguments=("${@:2}")

	package_file="$JETPACK_ROOT/lib/required/${package}.sh"

	if [ ! -f $package_file ]; then
		fail "Could not find requirement $package!"
	fi

	source "$package_file"
	"install_$package" $arguments

	if [ -d "$BUILD_DIR/.profile.d" ]; then
		for f in "$BUILD_DIR/.profile.d/"*; do source $f; done
	fi
}
