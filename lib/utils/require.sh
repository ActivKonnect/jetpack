# vim: fileencoding=utf-8 tw=100 noexpandtab ts=8 sw=8 ft=sh :

function require {
	package=$1
	version=$2

	require_dir="$CACHE_DIR/require"
	mkdir -p $require_dir

	require_file="${require_dir}/${package}"

	installed_version="none"
	if [ -f "$require_file" ]; then
		installed_version=$(cat "$require_file")
	fi

	if [ "$version" == "$installed_version" ]; then
		shout "$package already at version $version"
	else
		package_file="$JETPACK_ROOT/lib/required/${package}.sh"

		if [ ! -f $package_file ]; then
			fail "Could not find requirement $package!"
		fi

		source "$package_file"
		"install_$package"

		echo "$version" > "$require_file"
	fi
}
