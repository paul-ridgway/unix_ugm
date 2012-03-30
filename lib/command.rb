class Command
  #TODO: Move to own gem...
  def self.execute(command)
    pid = 0
    exit_status = 0

    # Open3.popen3([env,] cmd... [, opts])
    Open3.popen3(command) do |stdin, stdout, stderr, wait_thr|
      pid = wait_thr.pid # pid of the started process.
      exit_status = wait_thr.value # Process::Status object returned.
    end

    exit_status
  end
end