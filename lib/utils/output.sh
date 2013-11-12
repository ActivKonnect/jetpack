_IS_LINE_CLEAR=true

function clear_line {
	if ! $_IS_LINE_CLEAR; then
		echo
	fi

	_IS_LINE_CLEAR=true
}

function indent {
	clear_line
	sed -u 's/^/       /'
	_IS_LINE_CLEAR=false
}

function shout {
	clear_line
	echo "$@" | fold -sw 73 | sed -u 's/^/       /' | sed -u '1 s/^       /-----> /'
	_IS_LINE_CLEAR=false
}

function fail {
	clear_line
	shout "Fail! $@"
	exit 1
}
