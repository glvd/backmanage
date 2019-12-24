package model

// Config ...
type Config struct {
	Identity     Identity     `json:"Identity"`
	Datastore    Datastore    `json:"Datastore"`
	Addresses    Addresses    `json:"Addresses"`
	Mounts       Mounts       `json:"Mounts"`
	Discovery    Discovery    `json:"Discovery"`
	Routing      Routing      `json:"Routing"`
	Ipns         Ipns         `json:"Ipns"`
	Bootstrap    []string     `json:"Bootstrap"`
	Gateway      Gateway      `json:"Gateway"`
	API          API          `json:"API"`
	Swarm        Swarm        `json:"Swarm"`
	Pubsub       Pubsub       `json:"Pubsub"`
	Provider     Provider     `json:"Provider"`
	Reprovider   Reprovider   `json:"Reprovider"`
	Experimental Experimental `json:"Experimental"`
	Plugins      Plugins      `json:"Plugins"`
}

// API ...
type API struct {
	HTTPHeaders APIHTTPHeaders `json:"HTTPHeaders"`
}

// APIHTTPHeaders ...
type APIHTTPHeaders struct {
}

// Addresses ...
type Addresses struct {
	Swarm      []string      `json:"Swarm"`
	Announce   []interface{} `json:"Announce"`
	NoAnnounce []interface{} `json:"NoAnnounce"`
	API        string        `json:"API"`
	Gateway    string        `json:"Gateway"`
}

// Datastore ...
type Datastore struct {
	StorageMax         string `json:"StorageMax"`
	StorageGCWatermark int64  `json:"StorageGCWatermark"`
	GCPeriod           string `json:"GCPeriod"`
	Spec               Spec   `json:"Spec"`
	HashOnRead         bool   `json:"HashOnRead"`
	BloomFilterSize    int64  `json:"BloomFilterSize"`
}

// Spec ...
type Spec struct {
	Mounts []Mount `json:"mounts"`
	Type   string  `json:"type"`
}

// Mount ...
type Mount struct {
	Child      Child  `json:"child"`
	Mountpoint string `json:"mountpoint"`
	Prefix     string `json:"prefix"`
	Type       string `json:"type"`
}

// Child ...
type Child struct {
	Path        string  `json:"path"`
	ShardFunc   *string `json:"shardFunc,omitempty"`
	Sync        *bool   `json:"sync,omitempty"`
	Type        string  `json:"type"`
	Compression *string `json:"compression,omitempty"`
}

// Discovery ...
type Discovery struct {
	Mdns Mdns `json:"MDNS"`
}

// Mdns ...
type Mdns struct {
	Enabled  bool  `json:"Enabled"`
	Interval int64 `json:"Interval"`
}

// Experimental ...
type Experimental struct {
	FilestoreEnabled     bool `json:"FilestoreEnabled"`
	UrlstoreEnabled      bool `json:"UrlstoreEnabled"`
	ShardingEnabled      bool `json:"ShardingEnabled"`
	Libp2PStreamMounting bool `json:"Libp2pStreamMounting"`
	P2PHTTPProxy         bool `json:"P2pHttpProxy"`
	Quic                 bool `json:"QUIC"`
	PreferTLS            bool `json:"PreferTLS"`
	StrategicProviding   bool `json:"StrategicProviding"`
}

// Gateway ...
type Gateway struct {
	HTTPHeaders  GatewayHTTPHeaders `json:"HTTPHeaders"`
	RootRedirect string             `json:"RootRedirect"`
	Writable     bool               `json:"Writable"`
	PathPrefixes []interface{}      `json:"PathPrefixes"`
	APICommands  []interface{}      `json:"APICommands"`
	NoFetch      bool               `json:"NoFetch"`
}

// GatewayHTTPHeaders ...
type GatewayHTTPHeaders struct {
	AccessControlAllowHeaders []string `json:"Access-Control-Allow-Headers"`
	AccessControlAllowMethods []string `json:"Access-Control-Allow-Methods"`
	AccessControlAllowOrigin  []string `json:"Access-Control-Allow-Origin"`
}

// Identity ...
type Identity struct {
	PeerID  string `json:"PeerID"`
	PrivKey string `json:"PrivKey"`
}

// Ipns ...
type Ipns struct {
	RepublishPeriod  string `json:"RepublishPeriod"`
	RecordLifetime   string `json:"RecordLifetime"`
	ResolveCacheSize int64  `json:"ResolveCacheSize"`
}

// Mounts ...
type Mounts struct {
	Ipfs           string `json:"IPFS"`
	Ipns           string `json:"IPNS"`
	FuseAllowOther bool   `json:"FuseAllowOther"`
}

// Plugins ...
type Plugins struct {
	Plugins interface{} `json:"Plugins"`
}

// Provider ...
type Provider struct {
	Strategy string `json:"Strategy"`
}

// Pubsub ...
type Pubsub struct {
	Router                      string `json:"Router"`
	DisableSigning              bool   `json:"DisableSigning"`
	StrictSignatureVerification bool   `json:"StrictSignatureVerification"`
}

// Reprovider ...
type Reprovider struct {
	Interval string `json:"Interval"`
	Strategy string `json:"Strategy"`
}

// Routing ...
type Routing struct {
	Type string `json:"Type"`
}

// Swarm ...
type Swarm struct {
	AddrFilters             interface{} `json:"AddrFilters"`
	DisableBandwidthMetrics bool        `json:"DisableBandwidthMetrics"`
	DisableNatPortMap       bool        `json:"DisableNatPortMap"`
	DisableRelay            bool        `json:"DisableRelay"`
	EnableRelayHop          bool        `json:"EnableRelayHop"`
	EnableAutoRelay         bool        `json:"EnableAutoRelay"`
	EnableAutoNATService    bool        `json:"EnableAutoNATService"`
	ConnMgr                 ConnMgr     `json:"ConnMgr"`
}

// ConnMgr ...
type ConnMgr struct {
	Type        string `json:"Type"`
	LowWater    int64  `json:"LowWater"`
	HighWater   int64  `json:"HighWater"`
	GracePeriod string `json:"GracePeriod"`
}

// NodeTypeDocker ...
const NodeTypeDocker = "docker"

// NodeTypeBin ...
const NodeTypeBin = "bin"

// Node ...
type Node struct {
	Model
	Type       string
	NodeID     string
	NodeAddr   string
	ConfigPath string
}
