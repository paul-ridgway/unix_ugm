require_relative 'command'

class UnixGroup

  #------------------------------------------------------#
  # Static methods
  #------------------------------------------------------#

  def self.list
    passwd_file = File.open('/etc/group', 'r')
    passwd_data = passwd_file.read
    entries = passwd_data.split "\n"
    list = []
    entries.each do |entry|
      fields = entry.split(':')
      list << UnixGroup.new({
                                :name => fields[0],
                                :password => fields[1],
                                :gid => fields[2],
                                :users => fields[3]
                            })
    end
    list
  end

  def self.find(name)
    groups = list.select { |group| group.name == name }
    groups.size != 0 ? groups.first : nil
  end

  #------------------------------------------------------#
  # Instance methods
  #------------------------------------------------------#

  attr_reader :name,
              :password,
              :gid,
              :users

  def initialize(options)
    @name = options[:name]
    @password = options[:password]
    @gid = options[:gid].to_i
    @users = options[:users]
  end

end
