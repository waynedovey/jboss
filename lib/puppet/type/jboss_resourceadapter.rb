Puppet::Type.newtype(:jboss_resourceadapter) do
  @doc = "Manages resource adapters on JBoss Application Server"
  ensurable

  newparam(:name) do
    desc "The name/ID of resource adapter."
    isnamevar
    isrequired
  end
  
  newproperty(:archive) do
    desc "The resource adapter archive."
    isrequired
  end

  newproperty(:transactionsupport) do
    desc "The resource adapter transaction support type."
    isrequired
  end
  
  newproperty(:jndiname, :array_matching => :all) do
    desc "The resource adapter connection definition jndi name."
    isrequired
  end
  
  newproperty(:classname) do
    desc "The resource adapter connection definition class name."
    isrequired
  end
  
  newproperty(:security) do 
    desc "The resource adapter connection definition security."
    isrequired
    defaultto 'application'
  end
  
  newproperty(:backgroundvalidation, :boolean => true) do
    desc "The resource adapter connection definition class name."
    isrequired
    defaultto true
  end

  newparam(:profile) do
    desc "The JBoss profile name"
    defaultto "full"
  end

  newparam(:runasdomain, :boolean => true) do
    desc "Indicate that server is in domain mode"
    defaultto true
  end
  
  newparam(:controller) do
    desc "Domain controller host:port address"
    validate do |value|
      if value == nil or value.to_s == 'undef'
        raise ArgumentError, "Domain controller must be provided"
      end
    end
  end
  
  newparam :ctrluser do
    desc 'A user name to connect to controller'
  end

  newparam :ctrlpasswd do
    desc 'A password to be used to connect to controller'
  end

  newparam :retry do
    desc "Number of retries."
    defaultto 3
  end

  newparam :retry_timeout do
    desc "Retry timeout in seconds"
    defaultto 1
  end

end
