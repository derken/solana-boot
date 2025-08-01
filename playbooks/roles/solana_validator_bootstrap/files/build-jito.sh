#!/bin/bash
#
# This is a positional arguments-only example of Argbash potential
#
# ARG_HELP([The general script's help msg])
# ARG_POSITIONAL_SINGLE([tag-version],[Jito Solana version])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.9.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info
# Generated online by https://argbash.io/generate


die()
{
	local _ret="${2:-1}"
	test "${_PRINT_HELP:-no}" = yes && print_help >&2
	echo "$1" >&2
	exit "${_ret}"
}

begins_with_short_option()
{
	local first_option all_short_options='h'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
# THE DEFAULTS INITIALIZATION - OPTIONALS


print_help()
{
	printf '%s\n' "The general script's help msg"
	printf 'Usage: %s [-h|--help] <tag-version>\n' "$0"
	printf '\t%s\n' "<tag-version>: Jito Solana version"
	printf '\t%s\n' "-h, --help: Prints help"
}


parse_commandline()
{
	_positionals_count=0
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			*)
				_last_positional="$1"
				_positionals+=("$_last_positional")
				_positionals_count=$((_positionals_count + 1))
				;;
		esac
		shift
	done
}


handle_passed_args_count()
{
	local _required_args_string="'tag-version'"
	test "${_positionals_count}" -ge 1 || _PRINT_HELP=yes die "FATAL ERROR: Not enough positional arguments - we require exactly 1 (namely: $_required_args_string), but got only ${_positionals_count}." 1
	test "${_positionals_count}" -le 1 || _PRINT_HELP=yes die "FATAL ERROR: There were spurious positional arguments --- we expect exactly 1 (namely: $_required_args_string), but got ${_positionals_count} (the last one was: '${_last_positional}')." 1
}


assign_positional_args()
{
	local _positional_name _shift_for=$1
	_positional_names="_arg_tag_version "

	shift "$_shift_for"
	for _positional_name in ${_positional_names}
	do
		test $# -gt 0 || break
		eval "$_positional_name=\${1}" || die "Error during argument parsing, possibly an Argbash bug." 1
		shift
	done
}

parse_commandline "$@"
handle_passed_args_count
assign_positional_args 1 "${_positionals[@]}"

echo Check if required packages are installed.

packages=("libssl-dev" "libudev-dev" "pkg-config" "zlib1g-dev" "llvm" "clang" "cmake" "make" "libprotobuf-dev" "protobuf-compiler" "libclang-dev")
missing_packages=()

for package in "${packages[@]}"
do
    if dpkg -s "$package" >/dev/null 2>&1; then
        echo "$package is installed."
    else
        missing_packages+=($package)
    fi
done

# shellcheck disable=SC2128
[ "${#missing_packages[@]}" -ne 0 ] && {
    echo ERROR: following packages are missing "${missing_packages[@]}";
    echo hint: sudo apt install -y "${missing_packages[@]}"
    exit 1;
  }

if ! command -v cargo &> /dev/null
then
  curl https://sh.rustup.rs -sSf | sh
fi

source "$HOME/.cargo/env"

rustup component add rustfmt

rustup update

git clone https://github.com/jito-foundation/jito-solana.git --recurse-submodules

TAG=$_arg_tag_version

cd jito-solana || exit

git checkout tags/"$TAG"

git submodule update --init --recursive

CI_COMMIT=$(git rev-parse HEAD) scripts/cargo-install-all.sh --validator-only ~/.local/share/solana/install/releases/"$TAG"

rm -rf "$HOME"/.local/share/solana/install/active_release

ln -sf /home/solana/.local/share/solana/install/releases/"$TAG" "$HOME"/.local/share/solana/install/active_release

#rm -rf "$HOME"/jito-solana
