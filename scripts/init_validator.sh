#!/bin/bash
#
# This is a rather minimal example Argbash potential
# Example taken from http://argbash.readthedocs.io/en/stable/example.html
#
# ARG_OPTIONAL_SINGLE([cluster],[c],[Solana cluster],[mainnet-beta])
# ARG_OPTIONAL_SINGLE([ledger-path],[l],[Solana client ledger path],[/mnt/solana/ledger])
# ARG_OPTIONAL_SINGLE([snapshots-path],[],[Solana client snapshots path],[/mnt/solana/snapshots])
# ARG_OPTIONAL_SINGLE([accounts-path],[],[Solana client snapshots path],[/mnt/solana/accounts])
# ARG_OPTIONAL_SINGLE([log-level],[],[Solana client log level],[WARN])
# ARG_OPTIONAL_SINGLE([ramdisk-size-gb],[],[Solana client ram disk size],[200])
# ARG_OPTIONAL_SINGLE([swap-file-size-gb],[],[Solana client swap file size],[128])
# ARG_OPTIONAL_SINGLE([secrets-path],[],[Solana client secrets path],[/home/solana/.secrets])
# ARG_OPTIONAL_SINGLE([solana-user],[],[Solana client user],[solana])
# ARG_OPTIONAL_SINGLE([solana-version],[],[Solana client version],[1.13.6])
# ARG_OPTIONAL_SINGLE([use-ramdisk-for-account],[],[Put accounts in ramdisk],[True])
# ARG_OPTIONAL_SINGLE([jito-enable],[],[Enable Jito configuration],[False])
# ARG_OPTIONAL_SINGLE([jito-block-engine-url],[],[Jito block engine URL],[])
# ARG_OPTIONAL_SINGLE([jito-relayer-url],[],[Jito relayer URL],[])
# ARG_OPTIONAL_SINGLE([jito-receiver-addr],[],[Jito reciver address],[])
# ARG_OPTIONAL_SINGLE([jito-tip-payment-program-pubkey],[],[Jito tip payment program pubkey],[])
# ARG_OPTIONAL_SINGLE([jito-distribution-program-pubkey],[],[Jito distribution program pubkey],[])
# ARG_OPTIONAL_SINGLE([jito-merkle-root-upload-authority],[],[Jito merkle root upload authority],[])
# ARG_OPTIONAL_SINGLE([jito-commission-bps],[],[Jito commission bps],[0])
# ARG_HELP([The general script's help msg])
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
	local first_option all_short_options='clh'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_cluster="mainnet-beta"
_arg_ledger_path="/mnt/solana/ledger"
_arg_snapshots_path="/mnt/solana/snapshots"
_arg_accounts_path="/mnt/solana/accounts"
_arg_log_level="WARN"
_arg_ramdisk_size_gb="200"
_arg_swap_file_size_gb="128"
_arg_secrets_path="/home/solana/.secrets"
_arg_solana_user="solana"
_arg_solana_version="1.18.22"
_arg_use_ramdisk_for_account="True"
_arg_jito_enable="False"
_arg_jito_block_engine_url=
_arg_jito_relayer_url=
_arg_jito_receiver_addr=
_arg_jito_tip_payment_program_pubkey=
_arg_jito_distribution_program_pubkey=
_arg_jito_merkle_root_upload_authority=
_arg_jito_commission_bps="0"


print_help()
{
	printf '%s\n' "The general script's help msg"
	printf 'Usage: %s [-c|--cluster <arg>] [-l|--ledger-path <arg>] [--snapshots-path <arg>] [--accounts-path <arg>] [--log-level <arg>] [--ramdisk-size-gb <arg>] [--swap-file-size-gb <arg>] [--secrets-path <arg>] [--solana-user <arg>] [--solana-version <arg>] [--use-ramdisk-for-account <arg>] [--jito-enable <arg>] [--jito-block-engine-url <arg>] [--jito-relayer-url <arg>] [--jito-receiver-addr <arg>] [--jito-tip-payment-program-pubkey <arg>] [--jito-distribution-program-pubkey <arg>] [--jito-merkle-root-upload-authority <arg>] [--jito-commission-bps <arg>] [-h|--help]\n' "$0"
	printf '\t%s\n' "-c, --cluster: Solana cluster (default: 'mainnet-beta')"
	printf '\t%s\n' "-l, --ledger-path: Solana client ledger path (default: '/mnt/solana/ledger')"
	printf '\t%s\n' "--snapshots-path: Solana client snapshots path (default: '/mnt/solana/snapshots')"
	printf '\t%s\n' "--accounts-path: Solana client snapshots path (default: '/mnt/solana/accounts')"
	printf '\t%s\n' "--log-level: Solana client log level (default: 'WARN')"
	printf '\t%s\n' "--ramdisk-size-gb: Solana client ram disk size (default: '200')"
	printf '\t%s\n' "--swap-file-size-gb: Solana client swap file size (default: '128')"
	printf '\t%s\n' "--secrets-path: Solana client secrets path (default: '/home/solana/.secrets')"
	printf '\t%s\n' "--solana-user: Solana client user (default: 'solana')"
	printf '\t%s\n' "--solana-version: Solana client version (default: '1.13.6')"
	printf '\t%s\n' "--use-ramdisk-for-account: Put accounts in ramdisk (default: 'True')"
	printf '\t%s\n' "--jito-enable: Enable Jito configuration (default: 'False')"
	printf '\t%s\n' "--jito-block-engine-url: Jito block engine URL (no default)"
	printf '\t%s\n' "--jito-relayer-url: Jito relayer URL (no default)"
	printf '\t%s\n' "--jito-receiver-addr: Jito reciver address (no default)"
	printf '\t%s\n' "--jito-tip-payment-program-pubkey: Jito tip payment program pubkey (no default)"
	printf '\t%s\n' "--jito-distribution-program-pubkey: Jito distribution program pubkey (no default)"
	printf '\t%s\n' "--jito-merkle-root-upload-authority: Jito merkle root upload authority (no default)"
	printf '\t%s\n' "--jito-commission-bps: Jito commission bps (default: '0')"
	printf '\t%s\n' "-h, --help: Prints help"
}


parse_commandline()
{
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			-c|--cluster)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_cluster="$2"
				shift
				;;
			--cluster=*)
				_arg_cluster="${_key##--cluster=}"
				;;
			-c*)
				_arg_cluster="${_key##-c}"
				;;
			-l|--ledger-path)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_ledger_path="$2"
				shift
				;;
			--ledger-path=*)
				_arg_ledger_path="${_key##--ledger-path=}"
				;;
			-l*)
				_arg_ledger_path="${_key##-l}"
				;;
			--snapshots-path)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_snapshots_path="$2"
				shift
				;;
			--snapshots-path=*)
				_arg_snapshots_path="${_key##--snapshots-path=}"
				;;
			--accounts-path)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_accounts_path="$2"
				shift
				;;
			--accounts-path=*)
				_arg_accounts_path="${_key##--accounts-path=}"
				;;
			--log-level)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_log_level="$2"
				shift
				;;
			--log-level=*)
				_arg_log_level="${_key##--log-level=}"
				;;
			--ramdisk-size-gb)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_ramdisk_size_gb="$2"
				shift
				;;
			--ramdisk-size-gb=*)
				_arg_ramdisk_size_gb="${_key##--ramdisk-size-gb=}"
				;;
			--swap-file-size-gb)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_swap_file_size_gb="$2"
				shift
				;;
			--swap-file-size-gb=*)
				_arg_swap_file_size_gb="${_key##--swap-file-size-gb=}"
				;;
			--secrets-path)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_secrets_path="$2"
				shift
				;;
			--secrets-path=*)
				_arg_secrets_path="${_key##--secrets-path=}"
				;;
			--solana-user)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_solana_user="$2"
				shift
				;;
			--solana-user=*)
				_arg_solana_user="${_key##--solana-user=}"
				;;
			--solana-version)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_solana_version="$2"
				shift
				;;
			--solana-version=*)
				_arg_solana_version="${_key##--solana-version=}"
				;;
			--use-ramdisk-for-account)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_use_ramdisk_for_account="$2"
				shift
				;;
			--use-ramdisk-for-account=*)
				_arg_use_ramdisk_for_account="${_key##--use-ramdisk-for-account=}"
				;;
			--jito-enable)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_jito_enable="$2"
				shift
				;;
			--jito-enable=*)
				_arg_jito_enable="${_key##--jito-enable=}"
				;;
			--jito-block-engine-url)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_jito_block_engine_url="$2"
				shift
				;;
			--jito-block-engine-url=*)
				_arg_jito_block_engine_url="${_key##--jito-block-engine-url=}"
				;;
			--jito-relayer-url)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_jito_relayer_url="$2"
				shift
				;;
			--jito-relayer-url=*)
				_arg_jito_relayer_url="${_key##--jito-relayer-url=}"
				;;
			--jito-receiver-addr)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_jito_receiver_addr="$2"
				shift
				;;
			--jito-receiver-addr=*)
				_arg_jito_receiver_addr="${_key##--jito-receiver-addr=}"
				;;
			--jito-tip-payment-program-pubkey)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_jito_tip_payment_program_pubkey="$2"
				shift
				;;
			--jito-tip-payment-program-pubkey=*)
				_arg_jito_tip_payment_program_pubkey="${_key##--jito-tip-payment-program-pubkey=}"
				;;
			--jito-distribution-program-pubkey)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_jito_distribution_program_pubkey="$2"
				shift
				;;
			--jito-distribution-program-pubkey=*)
				_arg_jito_distribution_program_pubkey="${_key##--jito-distribution-program-pubkey=}"
				;;
			--jito-merkle-root-upload-authority)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_jito_merkle_root_upload_authority="$2"
				shift
				;;
			--jito-merkle-root-upload-authority=*)
				_arg_jito_merkle_root_upload_authority="${_key##--jito-merkle-root-upload-authority=}"
				;;
			--jito-commission-bps)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_jito_commission_bps="$2"
				shift
				;;
			--jito-commission-bps=*)
				_arg_jito_commission_bps="${_key##--jito-commission-bps=}"
				;;
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			*)
				_PRINT_HELP=yes die "FATAL ERROR: Got an unexpected argument '$1'" 1
				;;
		esac
		shift
	done
}

parse_commandline "$@"

install_ansible_collection () {
  timeout 60 ansible-galaxy collection install ansible.posix
  timeout 60 ansible-galaxy collection install community.general
}

init_validator () {
  ansible-playbook \
    --connection=local \
    --inventory ./playbooks/inventory/"$_arg_cluster".yaml \
    --limit localhost  playbooks/bootstrap_validator.yaml \
    --extra-vars "{ \
    'ledger_path': $_arg_ledger_path, \
    'log_level': $_arg_log_level, \
    'ramdisk_size_gb': $_arg_ramdisk_size_gb, \
    'swap_file_size_gb': $_arg_swap_file_size_gb, \
    'secrets_path': $_arg_secrets_path, \
    'snapshots_path': $_arg_snapshots_path, \
    'solana_user': $_arg_solana_user, \
    'solana_version': $_arg_solana_version, \
    'use_ramdisk_for_account': $_arg_use_ramdisk_for_account, \
    'jito_enable': $_arg_jito_enable, \
    'jito_block_engine_url': $_arg_jito_block_engine_url, \
    'jito_relayer_url': $_arg_jito_relayer_url, \
    'jito_receiver_addr': $_arg_jito_receiver_addr, \
    'jito_tip_payment_program_pubkey': $_arg_jito_tip_payment_program_pubkey, \
    'jito_distribution_program_pubkey': $_arg_jito_distribution_program_pubkey, \
    'jito_merkle_root_upload_authority': $_arg_jito_merkle_root_upload_authority, \
    'jito_commission_bps': $_arg_jito_commission_bps
    }"
}

install_ansible_collection
init_validator
update-motd
