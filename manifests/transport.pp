# @summary
# This module configures a single transport in exims configuration
#
# @param allow_localhost
# Allow connections to localhost
#
# @param comment
# Comment a router, this will be placed as a comment just above
# the router.
#
# @param driver
# Type of transport.
#
# @param protocol
# Protocol of transport.
#
# @param connect_timeout
# Timeout when connecting to remote Servers.
#
# @param connection_max_messages
# Set the maximum number of messages that can be transfered in a single connection.
#
# @param exim_environment
# This option is used to add additional variables to the environment in which the command runs.
#
# @param fallback_hosts
# If Exim is unable to deliver to any of the hosts for a particular address, and the
# errors are not permanent rejections, the address is put on a separate transport
# queue with its host list replaced by the fallback hosts.
#
# @param from
# sets the from address
#
# @param helo_data
# sets the helo name exim uses when connecting to a remote server.
#
# @param headers_remove
# list of headers to remove.
#
# @param headers_add
# list of headers to add.
#
# @param hosts
# The hosts option specifies a list of hosts to be used if the address
# being processed does not have any hosts associated with it. The hosts
# specified by hosts are also used, whether or not the address has its
# own hosts, if hosts_override is set.
#
# @param hosts_require_auth
# Specifies a list of servers for which authentication must succeed before Exim will try
# to transfer a message. If authentication fails for one of these servers, delivery is deferred.
#
# @param hosts_require_tls
# List of hosts requiring tls, messages are only sent if tls can be established.
#
# @param hosts_try_auth
# The host_try_auth option provides a list of hosts to which, provided they announce
# authentication support, Exim will attempt to authenticate as a client when it connects.
#
# @param path
# This option specifies the string that is set up in the
# PATH environment variable of the subprocess.
#
# @param port
# The port exim connects to on the remote server
#
# @param return_fail_output
# If set to true, the command output is returned in the bounce message in case of failure.
#
# @param return_output
# If this option is true, and the command produced any output, the delivery
# is deemed to have failed whatever the return code from the command, and
# the output is returned in the bounce message
#
# @param timeout
# If the command fails to complete within this time, it is killed.
#
# @param timeout_defer
# Set this to true for timeouts to become temporary errors, causing the 
# delivery to be deferred.
#
# @param tls_dh_min_bits
# set the minimum acceptable number of bits in the Diffie-Hellman prime 
# offered by a server,
# default is 1024
#
# @param tls_verify_certificates
# Give a path to certificates agains which connections are verified.
#
# @param interface
# sets the outgoing ip for smtp transports.
#
# @param dkim_domain
# The domain(s) you want to sign with
#
# @param dkim_selector
# This sets the key selector string.
#
# @param dkim_private_key
# This sets the private key to use. You can use the $dkim_domain and
# $dkim_selector expansion variables to determine the private key to use.
# The result can either
#  - be a valid RSA private key in ASCII armor, including line breaks.
#  - start with a slash, in which case it is treated as a file that contains
#  the private key.
#  - be "0", "false" or the empty string, in which case the message will not
#  be signed. This case will not result in an error, even if dkim_strict
#  is set.
#
# @param dkim_canon
# This option sets the canonicalization method used when signing a message.
# The DKIM RFC currently supports two methods: "simple" and "relaxed".
# Note: the current implementation only supports using the same
# canonicalization method for both headers and body.
#
# @param dkim_strict
# This option defines how Exim behaves when signing a message that should be
# signed fails for some reason.
# When the expansion evaluates to either "1" or "true", Exim will defer.
# Otherwise Exim will send the message unsigned.
# You can use the $dkim_domain and $dkim_selector expansion variables here.
#
# @param once
# Use:autoreply;Type:string;Default:unset; This option names a file or DBM
# database in which a record of each To: recipient is kept when the message
# is specified by the transport. 
#
# @param once_repeat
# Use:autoreply;Type:time;Default:0s; specifies a maximum time between
# repeats
#
# @param once_file_size
# Use:autoreply;Type:integer;Default:0; If once_file_size is zero, a DBM
# database is used to remember recipients, and it is allowed to grow as large
# as necessary. If once_file_size is set greater than zero, it changes the
# way Exim implements the once option. Instead of using a DBM file to record
# every recipient it sends to, it uses a regular file, whose size will never
# get larger than the given value. 
#
# @param headers
# Use:autoreply;Type:string;Default:unset; This specifies additional RFC 2822
# headers that are to be added to the message when the message is specified
# by the transport. Several can be given by using “\n” to separate them.
# There is no check on the format.
#
# @param return_message
# Use:autoreply;Type:boolean;Default:false; If this is set, a copy of the
# original message is returned with the new message, subject to the maximum
# size set in the return_size_limit global configuration option.
#
# @param debug_print
# Used to print debug information
#
#
define exim::transport (
  Boolean                 $allow_localhost           = false,
  Boolean                 $delivery_date_add         = false,
  Boolean                 $envelope_to_add           = false,
  Boolean                 $freeze_exec_fail          = false,
  Boolean                 $initgroups                = false,
  Boolean                 $log_output                = false,
  Boolean                 $maildir_format            = false,
  Boolean                 $rcpt_include_affixes      = false,
  Boolean                 $return_fail_output        = false,
  Boolean                 $return_output             = false,
  Boolean                 $return_path_add           = false,
  Boolean                 $timeout_defer             = false,
  Optional[Array[String]] $dkim_domain               = undef,
  Optional[Array[String]] $fallback_hosts            = undef,
  Optional[Array[String]] $headers_add               = undef,
  Optional[Array[String]] $headers_remove            = undef,
  Optional[Array[String]] $hosts                     = undef,
  Optional[Array[String]] $hosts_require_auth        = undef,
  Optional[Array[String]] $hosts_require_tls         = undef,
  Optional[Array[String]] $hosts_try_auth            = undef,
  Optional[Array[String]] $temp_errors               = undef,
  Optional[Integer]       $batch_max                 = undef,
  Optional[Integer]       $connection_max_messages   = undef,
  Optional[Integer]       $dkim_strict               = undef,
  Optional[Integer]       $port                      = undef,
  Optional[Integer]       $tls_dh_min_bits           = undef,
  Optional[String[1]]     $command                   = undef,
  Optional[Array[String]] $comment                   = undef,
  Optional[String[1]]     $connect_timeout           = undef,
  Optional[String[1]]     $debug_print               = undef,
  Optional[String[1]]     $directory                 = undef,
  Optional[String[1]]     $directory_mode            = undef,
  Optional[String[1]]     $dkim_canon                = undef,
  Optional[String[1]]     $dkim_selector             = undef,
  Optional[String[1]]     $dkim_private_key          = undef,
  Optional[String[1]]     $file                      = undef,
  Optional[String[1]]     $from                      = undef,
  Optional[String[1]]     $group                     = undef,
  Optional[String[1]]     $headers                   = undef,
  Optional[String[1]]     $helo_data                 = undef,
  Optional[String[1]]     $home_directory            = undef,
  Optional[String[1]]     $interface                 = undef,
  Optional[String[1]]     $maildir_tag               = undef,
  Optional[String[1]]     $message_prefix            = undef,
  Optional[String[1]]     $message_suffix            = undef,
  Optional[String[1]]     $mode                      = undef,
  Optional[String[1]]     $once                      = undef,
  Optional[String[1]]     $once_file_size            = undef,
  Optional[String[1]]     $once_repeat               = undef,
  Optional[String[1]]     $path                      = undef,
  Optional[String[1]]     $protocol                  = undef,
  Optional[String[1]]     $return_message            = undef,
  Optional[String[1]]     $socket                    = undef,
  Optional[String[1]]     $subject                   = undef,
  Optional[String[1]]     $text                      = undef,
  Optional[String[1]]     $timeout                   = undef,
  Optional[String[1]]     $tls_verify_certificates   = undef,
  Optional[String[1]]     $to                        = undef,
  Optional[String[1]]     $transport_filter          = undef,
  Optional[String[1]]     $user                      = undef,
  Optional[Tuple]         $exim_environment          = undef,
  String[1]               $driver                    = undef,
  ){

  concat::fragment { "transport-${title}":
    target  => $::exim::config_path,
    content => template("${module_name}/transport/transport.erb"),
    order   => 3001,
  }
}
