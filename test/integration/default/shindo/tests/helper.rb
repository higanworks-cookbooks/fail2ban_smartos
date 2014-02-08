require 'mixlib/shellout'

def shellout_matches?(command, regex)
  shell_out = Mixlib::ShellOut.new(command)
  shell_out.run_command
  !!(shell_out.stdout =~ regex )
end
