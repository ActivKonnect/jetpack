# vim: fileencoding=utf-8 tw=100 noexpandtab ts=8 sw=8 ft=sh :

function cp_contents {
	tar -C "$1" -c . | tar -C "$2" -x
}
