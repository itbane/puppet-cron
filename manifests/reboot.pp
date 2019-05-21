# Type: cron::reboot
#
# This type creates a cron job via a file in /etc/cron.d
#
# Parameters:
#   ensure - The state to ensure this resource exists in. Can be absent, present
#     Defaults to 'present'
#   environment - An array of environment variable settings.
#     Defaults to an empty set ([]).
#   user - The user the cron job should be executed as.
#     Defaults to 'root'.
#   mode - The mode to set on the created job file
#     Defaults to '0640'.
#   command - The command to execute.
#     Defaults to undef.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#   cron::reboot {
#     'log reboot time':
#       command     => 'date >> /etc/reboot-time && uptime >> /etc/reboot-time'
#   }

define cron::reboot (
  $command = undef, $user = 'root',
  $mode = '0640', $ensure = 'present', $environment = []
) {
  cron::job {
    $title:
      ensure      => $ensure,
      reboot      => $true,
      user        => $user,
      environment => $environment,
      mode        => $mode,
      command     => $command,
  }
}
