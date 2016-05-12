require 'httpclient'
require 'json'



class HTItem
  WEBCLIENT = HTTPClient.new

  NAMESPACES     = %w(
 aeu  bc  caia  chi  coo  dul1  emu  frick  gri  hvd  ia  iau  ien  inu  keio  ku01  loc  mcg  mdl  mdp  miua  miun  mmet  mou  msu  nc01  ncs1  njp  nnc1  nnc2  nyp  osu  psia  pst  pur1  pur2  txa  txu  uc1  uc2  ucm  ucw  udel  ufl1  ufl2  uiuc  uiug  uiuo  uma  umd  umn  usu  uva  wau  wu  yale  yul
)
  NAMESPACEMATCH = Regexp.union(NAMESPACES)
  IDMATCHER      = /#{NAMESPACEMATCH}\.\w+/
  ARKMATCHER     = /#{NAMESPACEMATCH}\.ark\:\/\d+\/\w+/
  SCANPAT        = Regexp.union(ARKMATCHER, IDMATCHER)

  EIGHT_DIGIT_DATE_PAT = /(\d{4})(\d{2})(\d{2})/


  attr_accessor :htid, :title, :record, :rights, :enumchron, :lastUpdate, :pdurl, :orig

  def initialize(htid)
    @htid   = htid.strip
    @client = WEBCLIENT
    self.load_json!
  end

  def url(htid)
    "http://catalog.hathitrust.org/api/volumes/brief/htid/#{htid}.json"
  end

  def load_json!
    h           = JSON.parse(@client.get_content(url(htid)))
    @title      = h['records'][h['records'].keys.first]['titles'].first
    idstuff     = h['items'].find { |x| x['htid'] == @htid }
    @record     = idstuff['fromRecord']
    @rights     = idstuff['rightsCode']
    @enumchron  = idstuff['enumcron']
    @lastUpdate = idstuff['lastUpdate']
    @pdurl      = idstuff['itemURL']
    @orig       = idstuff['orig']
  end

  def last_update_date_string
    m = EIGHT_DIGIT_DATE_PAT.match(@lastUpdate)
    m.to_a.slice(1..3).join('-')
  end

  def full_title
    @enumchron ? "#{title} [#{@enumchron}]" : title
  end

  def catalog_link
    "http://catalog.hathitrust.org/Record/#{record}"
  end

  def pt_link
    "http://hdl.handle.net/2027/#{htid}"
  end

  def marc_link
    "http://catalog.hathitrust.org/Record/#{record}.marc"
  end

  def ht_links
    "*#{htid}*: <#{catalog_link}|Catalog> / <#{pt_link}|PT> / <#{marc_link}|MARC>"
  end


end
