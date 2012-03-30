require_relative 'command'

class UnixUser

  #------------------------------------------------------#
  # Static methods
  #------------------------------------------------------#

  def self.list
    passwd_file = File.open('/etc/passwd', 'r')
    passwd_data = passwd_file.read
    entries = passwd_data.split "\n"
    list = []
    entries.each do |entry|
      fields = entry.split(':')
      list << UnixUser.new({
                               :username => fields[0],
                               :password => fields[1],
                               :uid => fields[2],
                               :gid => fields[3],
                               :user_info => fields[4],
                               :home_directory => fields[5],
                               :shell => fields[6]
                           })
    end
    list
  end

  def self.find(username)
    users = list.select { |user| user.username == username }
    users.size != 0 ? users.first : nil
  end

  #------------------------------------------------------#
  # Instance methods
  #------------------------------------------------------#

  attr_reader :username,
              :password,
              :uid,
              :gid,
              :user_info,
              :home_directory,
              :shell

  def initialize(options)
    @username = options[:username]
    @password = options[:password]
    @uid = options[:uid].to_i
    @gid = options[:gid].to_i
    @user_info = options[:user_info]
    @home_directory = options[:home_directory]
    @shell = options[:shell]
  end

end
