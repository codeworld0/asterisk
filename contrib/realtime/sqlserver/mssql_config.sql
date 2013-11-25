BEGIN TRANSACTION;

CREATE TABLE alembic_version (
    version_num VARCHAR(32) NOT NULL
);

GO

-- Running upgrade None -> 4da0c5f79a9c

CREATE TABLE sippeers (
    id INTEGER NOT NULL IDENTITY(1,1), 
    name VARCHAR(40) NOT NULL, 
    ipaddr VARCHAR(45) NULL, 
    port INTEGER NULL, 
    regseconds INTEGER NULL, 
    defaultuser VARCHAR(40) NULL, 
    fullcontact VARCHAR(80) NULL, 
    regserver VARCHAR(20) NULL, 
    useragent VARCHAR(20) NULL, 
    lastms INTEGER NULL, 
    host VARCHAR(40) NULL, 
    type VARCHAR(6) NULL, 
    context VARCHAR(40) NULL, 
    permit VARCHAR(95) NULL, 
    [deny] VARCHAR(95) NULL, 
    secret VARCHAR(40) NULL, 
    md5secret VARCHAR(40) NULL, 
    remotesecret VARCHAR(40) NULL, 
    transport VARCHAR(7) NULL, 
    dtmfmode VARCHAR(9) NULL, 
    directmedia VARCHAR(6) NULL, 
    nat VARCHAR(29) NULL, 
    callgroup VARCHAR(40) NULL, 
    pickupgroup VARCHAR(40) NULL, 
    language VARCHAR(40) NULL, 
    disallow VARCHAR(200) NULL, 
    allow VARCHAR(200) NULL, 
    insecure VARCHAR(40) NULL, 
    trustrpid VARCHAR(3) NULL, 
    progressinband VARCHAR(5) NULL, 
    promiscredir VARCHAR(3) NULL, 
    useclientcode VARCHAR(3) NULL, 
    accountcode VARCHAR(40) NULL, 
    setvar VARCHAR(200) NULL, 
    callerid VARCHAR(40) NULL, 
    amaflags VARCHAR(40) NULL, 
    callcounter VARCHAR(3) NULL, 
    busylevel INTEGER NULL, 
    allowoverlap VARCHAR(3) NULL, 
    allowsubscribe VARCHAR(3) NULL, 
    videosupport VARCHAR(3) NULL, 
    maxcallbitrate INTEGER NULL, 
    rfc2833compensate VARCHAR(3) NULL, 
    mailbox VARCHAR(40) NULL, 
    [session-timers] VARCHAR(9) NULL, 
    [session-expires] INTEGER NULL, 
    [session-minse] INTEGER NULL, 
    [session-refresher] VARCHAR(3) NULL, 
    t38pt_usertpsource VARCHAR(40) NULL, 
    regexten VARCHAR(40) NULL, 
    fromdomain VARCHAR(40) NULL, 
    fromuser VARCHAR(40) NULL, 
    qualify VARCHAR(40) NULL, 
    defaultip VARCHAR(45) NULL, 
    rtptimeout INTEGER NULL, 
    rtpholdtimeout INTEGER NULL, 
    sendrpid VARCHAR(3) NULL, 
    outboundproxy VARCHAR(40) NULL, 
    callbackextension VARCHAR(40) NULL, 
    timert1 INTEGER NULL, 
    timerb INTEGER NULL, 
    qualifyfreq INTEGER NULL, 
    constantssrc VARCHAR(3) NULL, 
    contactpermit VARCHAR(95) NULL, 
    contactdeny VARCHAR(95) NULL, 
    usereqphone VARCHAR(3) NULL, 
    textsupport VARCHAR(3) NULL, 
    faxdetect VARCHAR(3) NULL, 
    buggymwi VARCHAR(3) NULL, 
    auth VARCHAR(40) NULL, 
    fullname VARCHAR(40) NULL, 
    trunkname VARCHAR(40) NULL, 
    cid_number VARCHAR(40) NULL, 
    callingpres VARCHAR(21) NULL, 
    mohinterpret VARCHAR(40) NULL, 
    mohsuggest VARCHAR(40) NULL, 
    parkinglot VARCHAR(40) NULL, 
    hasvoicemail VARCHAR(3) NULL, 
    subscribemwi VARCHAR(3) NULL, 
    vmexten VARCHAR(40) NULL, 
    autoframing VARCHAR(3) NULL, 
    rtpkeepalive INTEGER NULL, 
    [call-limit] INTEGER NULL, 
    g726nonstandard VARCHAR(3) NULL, 
    ignoresdpversion VARCHAR(3) NULL, 
    allowtransfer VARCHAR(3) NULL, 
    dynamic VARCHAR(3) NULL, 
    path VARCHAR(256) NULL, 
    supportpath VARCHAR(3) NULL, 
    PRIMARY KEY (id), 
    UNIQUE (name), 
    CONSTRAINT type_values CHECK (type IN ('friend', 'user', 'peer')), 
    CONSTRAINT sip_transport_values CHECK (transport IN ('udp', 'tcp', 'tls', 'ws', 'wss', 'udp,tcp', 'tcp,udp')), 
    CONSTRAINT sip_dtmfmode_values CHECK (dtmfmode IN ('rfc2833', 'info', 'shortinfo', 'inband', 'auto')), 
    CONSTRAINT sip_directmedia_values CHECK (directmedia IN ('yes', 'no', 'nonat', 'update')), 
    CONSTRAINT yes_no_values CHECK (trustrpid IN ('yes', 'no')), 
    CONSTRAINT sip_progressinband_values CHECK (progressinband IN ('yes', 'no', 'never')), 
    CONSTRAINT yes_no_values CHECK (promiscredir IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (useclientcode IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (callcounter IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (allowoverlap IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (allowsubscribe IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (videosupport IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (rfc2833compensate IN ('yes', 'no')), 
    CONSTRAINT sip_session_timers_values CHECK ([session-timers] IN ('accept', 'refuse', 'originate')), 
    CONSTRAINT sip_session_refresher_values CHECK ([session-refresher] IN ('uac', 'uas')), 
    CONSTRAINT yes_no_values CHECK (sendrpid IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (constantssrc IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (usereqphone IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (textsupport IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (faxdetect IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (buggymwi IN ('yes', 'no')), 
    CONSTRAINT sip_callingpres_values CHECK (callingpres IN ('allowed_not_screened', 'allowed_passed_screen', 'allowed_failed_screen', 'allowed', 'prohib_not_screened', 'prohib_passed_screen', 'prohib_failed_screen', 'prohib')), 
    CONSTRAINT yes_no_values CHECK (hasvoicemail IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (subscribemwi IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (autoframing IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (g726nonstandard IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (ignoresdpversion IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (allowtransfer IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (dynamic IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (supportpath IN ('yes', 'no'))
);

GO

CREATE INDEX sippeers_name ON sippeers (name);

GO

CREATE INDEX sippeers_name_host ON sippeers (name, host);

GO

CREATE INDEX sippeers_ipaddr_port ON sippeers (ipaddr, port);

GO

CREATE INDEX sippeers_host_port ON sippeers (host, port);

GO

CREATE TABLE iaxfriends (
    id INTEGER NOT NULL IDENTITY(1,1), 
    name VARCHAR(40) NOT NULL, 
    type VARCHAR(6) NULL, 
    username VARCHAR(40) NULL, 
    mailbox VARCHAR(40) NULL, 
    secret VARCHAR(40) NULL, 
    dbsecret VARCHAR(40) NULL, 
    context VARCHAR(40) NULL, 
    regcontext VARCHAR(40) NULL, 
    host VARCHAR(40) NULL, 
    ipaddr VARCHAR(40) NULL, 
    port INTEGER NULL, 
    defaultip VARCHAR(20) NULL, 
    sourceaddress VARCHAR(20) NULL, 
    mask VARCHAR(20) NULL, 
    regexten VARCHAR(40) NULL, 
    regseconds INTEGER NULL, 
    accountcode VARCHAR(20) NULL, 
    mohinterpret VARCHAR(20) NULL, 
    mohsuggest VARCHAR(20) NULL, 
    inkeys VARCHAR(40) NULL, 
    outkeys VARCHAR(40) NULL, 
    language VARCHAR(10) NULL, 
    callerid VARCHAR(100) NULL, 
    cid_number VARCHAR(40) NULL, 
    sendani VARCHAR(3) NULL, 
    fullname VARCHAR(40) NULL, 
    trunk VARCHAR(3) NULL, 
    auth VARCHAR(20) NULL, 
    maxauthreq INTEGER NULL, 
    requirecalltoken VARCHAR(4) NULL, 
    encryption VARCHAR(6) NULL, 
    transfer VARCHAR(9) NULL, 
    jitterbuffer VARCHAR(3) NULL, 
    forcejitterbuffer VARCHAR(3) NULL, 
    disallow VARCHAR(200) NULL, 
    allow VARCHAR(200) NULL, 
    codecpriority VARCHAR(40) NULL, 
    qualify VARCHAR(10) NULL, 
    qualifysmoothing VARCHAR(3) NULL, 
    qualifyfreqok VARCHAR(10) NULL, 
    qualifyfreqnotok VARCHAR(10) NULL, 
    timezone VARCHAR(20) NULL, 
    adsi VARCHAR(3) NULL, 
    amaflags VARCHAR(20) NULL, 
    setvar VARCHAR(200) NULL, 
    PRIMARY KEY (id), 
    UNIQUE (name), 
    CONSTRAINT type_values CHECK (type IN ('friend', 'user', 'peer')), 
    CONSTRAINT yes_no_values CHECK (sendani IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (trunk IN ('yes', 'no')), 
    CONSTRAINT iax_requirecalltoken_values CHECK (requirecalltoken IN ('yes', 'no', 'auto')), 
    CONSTRAINT iax_encryption_values CHECK (encryption IN ('yes', 'no', 'aes128')), 
    CONSTRAINT iax_transfer_values CHECK (transfer IN ('yes', 'no', 'mediaonly')), 
    CONSTRAINT yes_no_values CHECK (jitterbuffer IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (forcejitterbuffer IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (qualifysmoothing IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (adsi IN ('yes', 'no'))
);

GO

CREATE INDEX iaxfriends_name ON iaxfriends (name);

GO

CREATE INDEX iaxfriends_name_host ON iaxfriends (name, host);

GO

CREATE INDEX iaxfriends_name_ipaddr_port ON iaxfriends (name, ipaddr, port);

GO

CREATE INDEX iaxfriends_ipaddr_port ON iaxfriends (ipaddr, port);

GO

CREATE INDEX iaxfriends_host_port ON iaxfriends (host, port);

GO

CREATE TABLE voicemail (
    uniqueid INTEGER NOT NULL IDENTITY(1,1), 
    context VARCHAR(80) NOT NULL, 
    mailbox VARCHAR(80) NOT NULL, 
    password VARCHAR(80) NOT NULL, 
    fullname VARCHAR(80) NULL, 
    alias VARCHAR(80) NULL, 
    email VARCHAR(80) NULL, 
    pager VARCHAR(80) NULL, 
    attach VARCHAR(3) NULL, 
    attachfmt VARCHAR(10) NULL, 
    serveremail VARCHAR(80) NULL, 
    language VARCHAR(20) NULL, 
    tz VARCHAR(30) NULL, 
    deletevoicemail VARCHAR(3) NULL, 
    saycid VARCHAR(3) NULL, 
    sendvoicemail VARCHAR(3) NULL, 
    review VARCHAR(3) NULL, 
    tempgreetwarn VARCHAR(3) NULL, 
    operator VARCHAR(3) NULL, 
    envelope VARCHAR(3) NULL, 
    sayduration INTEGER NULL, 
    forcename VARCHAR(3) NULL, 
    forcegreetings VARCHAR(3) NULL, 
    callback VARCHAR(80) NULL, 
    dialout VARCHAR(80) NULL, 
    exitcontext VARCHAR(80) NULL, 
    maxmsg INTEGER NULL, 
    volgain NUMERIC(5, 2) NULL, 
    imapuser VARCHAR(80) NULL, 
    imappassword VARCHAR(80) NULL, 
    imapserver VARCHAR(80) NULL, 
    imapport VARCHAR(8) NULL, 
    imapflags VARCHAR(80) NULL, 
    stamp DATETIME NULL, 
    PRIMARY KEY (uniqueid), 
    CONSTRAINT yes_no_values CHECK (attach IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (deletevoicemail IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (saycid IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (sendvoicemail IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (review IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (tempgreetwarn IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (operator IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (envelope IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (forcename IN ('yes', 'no')), 
    CONSTRAINT yes_no_values CHECK (forcegreetings IN ('yes', 'no'))
);

GO

CREATE INDEX voicemail_mailbox ON voicemail (mailbox);

GO

CREATE INDEX voicemail_context ON voicemail (context);

GO

CREATE INDEX voicemail_mailbox_context ON voicemail (mailbox, context);

GO

CREATE INDEX voicemail_imapuser ON voicemail (imapuser);

GO

CREATE TABLE meetme (
    bookid INTEGER NOT NULL IDENTITY(1,1), 
    confno VARCHAR(80) NOT NULL, 
    starttime DATETIME NULL, 
    endtime DATETIME NULL, 
    pin VARCHAR(20) NULL, 
    adminpin VARCHAR(20) NULL, 
    opts VARCHAR(20) NULL, 
    adminopts VARCHAR(20) NULL, 
    recordingfilename VARCHAR(80) NULL, 
    recordingformat VARCHAR(10) NULL, 
    maxusers INTEGER NULL, 
    members INTEGER NOT NULL, 
    PRIMARY KEY (bookid)
);

GO

CREATE INDEX meetme_confno_start_end ON meetme (confno, starttime, endtime);

GO

CREATE TABLE musiconhold (
    name VARCHAR(80) NOT NULL, 
    mode VARCHAR(10) NULL, 
    directory VARCHAR(255) NULL, 
    application VARCHAR(255) NULL, 
    digit VARCHAR(1) NULL, 
    sort VARCHAR(10) NULL, 
    format VARCHAR(10) NULL, 
    stamp DATETIME NULL, 
    PRIMARY KEY (name), 
    CONSTRAINT moh_mode_values CHECK (mode IN ('custom', 'files', 'mp3nb', 'quietmp3nb', 'quietmp3'))
);

GO

-- Running upgrade 4da0c5f79a9c -> 43956d550a44

CREATE TABLE ps_endpoints (
    id VARCHAR(40) NOT NULL, 
    transport VARCHAR(40) NULL, 
    aors VARCHAR(200) NULL, 
    auth VARCHAR(40) NULL, 
    context VARCHAR(40) NULL, 
    disallow VARCHAR(200) NULL, 
    allow VARCHAR(200) NULL, 
    direct_media VARCHAR(3) NULL, 
    connected_line_method VARCHAR(8) NULL, 
    direct_media_method VARCHAR(8) NULL, 
    direct_media_glare_mitigation VARCHAR(8) NULL, 
    disable_direct_media_on_nat VARCHAR(3) NULL, 
    dtmf_mode VARCHAR(7) NULL, 
    external_media_address VARCHAR(40) NULL, 
    force_rport VARCHAR(3) NULL, 
    ice_support VARCHAR(3) NULL, 
    identify_by VARCHAR(8) NULL, 
    mailboxes VARCHAR(40) NULL, 
    moh_suggest VARCHAR(40) NULL, 
    outbound_auth VARCHAR(40) NULL, 
    outbound_proxy VARCHAR(40) NULL, 
    rewrite_contact VARCHAR(3) NULL, 
    rtp_ipv6 VARCHAR(3) NULL, 
    rtp_symmetric VARCHAR(3) NULL, 
    send_diversion VARCHAR(3) NULL, 
    send_pai VARCHAR(3) NULL, 
    send_rpid VARCHAR(3) NULL, 
    timers_min_se INTEGER NULL, 
    timers VARCHAR(8) NULL, 
    timers_sess_expires INTEGER NULL, 
    callerid VARCHAR(40) NULL, 
    callerid_privacy VARCHAR(23) NULL, 
    callerid_tag VARCHAR(40) NULL, 
    [100rel] VARCHAR(8) NULL, 
    aggregate_mwi VARCHAR(3) NULL, 
    trust_id_inbound VARCHAR(3) NULL, 
    trust_id_outbound VARCHAR(3) NULL, 
    use_ptime VARCHAR(3) NULL, 
    use_avpf VARCHAR(3) NULL, 
    media_encryption VARCHAR(4) NULL, 
    inband_progress VARCHAR(3) NULL, 
    call_group VARCHAR(40) NULL, 
    pickup_group VARCHAR(40) NULL, 
    named_call_group VARCHAR(40) NULL, 
    named_pickup_group VARCHAR(40) NULL, 
    device_state_busy_at INTEGER NULL, 
    fax_detect VARCHAR(3) NULL, 
    t38_udptl VARCHAR(3) NULL, 
    t38_udptl_ec VARCHAR(10) NULL, 
    t38_udptl_maxdatagram INTEGER NULL, 
    t38_udptl_nat VARCHAR(3) NULL, 
    t38_udptl_ipv6 VARCHAR(3) NULL, 
    tone_zone VARCHAR(40) NULL, 
    language VARCHAR(40) NULL, 
    one_touch_recording VARCHAR(3) NULL, 
    record_on_feature VARCHAR(40) NULL, 
    record_off_feature VARCHAR(40) NULL, 
    rtp_engine VARCHAR(40) NULL, 
    allow_transfer VARCHAR(3) NULL, 
    allow_subscribe VARCHAR(3) NULL, 
    sdp_owner VARCHAR(40) NULL, 
    sdp_session VARCHAR(40) NULL, 
    tos_audio INTEGER NULL, 
    tos_video INTEGER NULL, 
    cos_audio INTEGER NULL, 
    cos_video INTEGER NULL, 
    sub_min_expiry INTEGER NULL, 
    from_domain VARCHAR(40) NULL, 
    from_user VARCHAR(40) NULL, 
    mwi_fromuser VARCHAR(40) NULL, 
    dtls_verify VARCHAR(40) NULL, 
    dtls_rekey VARCHAR(40) NULL, 
    dtls_cert_file VARCHAR(200) NULL, 
    dtls_private_key VARCHAR(200) NULL, 
    dtls_cipher VARCHAR(200) NULL, 
    dtls_ca_file VARCHAR(200) NULL, 
    dtls_ca_path VARCHAR(200) NULL, 
    dtls_setup VARCHAR(7) NULL, 
    srtp_tag_32 VARCHAR(3) NULL, 
    UNIQUE (id), 
    CONSTRAINT yesno_values CHECK (direct_media IN ('yes', 'no')), 
    CONSTRAINT pjsip_connected_line_method_values CHECK (connected_line_method IN ('invite', 'reinvite', 'update')), 
    CONSTRAINT pjsip_connected_line_method_values CHECK (direct_media_method IN ('invite', 'reinvite', 'update')), 
    CONSTRAINT pjsip_direct_media_glare_mitigation_values CHECK (direct_media_glare_mitigation IN ('none', 'outgoing', 'incoming')), 
    CONSTRAINT yesno_values CHECK (disable_direct_media_on_nat IN ('yes', 'no')), 
    CONSTRAINT pjsip_dtmf_mode_values CHECK (dtmf_mode IN ('rfc4733', 'inband', 'info')), 
    CONSTRAINT yesno_values CHECK (force_rport IN ('yes', 'no')), 
    CONSTRAINT yesno_values CHECK (ice_support IN ('yes', 'no')), 
    CONSTRAINT pjsip_identify_by_values CHECK (identify_by IN ('username')), 
    CONSTRAINT yesno_values CHECK (rewrite_contact IN ('yes', 'no')), 
    CONSTRAINT yesno_values CHECK (rtp_ipv6 IN ('yes', 'no')), 
    CONSTRAINT yesno_values CHECK (rtp_symmetric IN ('yes', 'no')), 
    CONSTRAINT yesno_values CHECK (send_diversion IN ('yes', 'no')), 
    CONSTRAINT yesno_values CHECK (send_pai IN ('yes', 'no')), 
    CONSTRAINT yesno_values CHECK (send_rpid IN ('yes', 'no')), 
    CONSTRAINT pjsip_timer_values CHECK (timers IN ('forced', 'no', 'required', 'yes')), 
    CONSTRAINT pjsip_cid_privacy_values CHECK (callerid_privacy IN ('allowed_not_screened', 'allowed_passed_screened', 'allowed_failed_screened', 'allowed', 'prohib_not_screened', 'prohib_passed_screened', 'prohib_failed_screened', 'prohib', 'unavailable')), 
    CONSTRAINT pjsip_100rel_values CHECK ([100rel] IN ('no', 'required', 'yes')), 
    CONSTRAINT yesno_values CHECK (aggregate_mwi IN ('yes', 'no')), 
    CONSTRAINT yesno_values CHECK (trust_id_inbound IN ('yes', 'no')), 
    CONSTRAINT yesno_values CHECK (trust_id_outbound IN ('yes', 'no')), 
    CONSTRAINT yesno_values CHECK (use_ptime IN ('yes', 'no')), 
    CONSTRAINT yesno_values CHECK (use_avpf IN ('yes', 'no')), 
    CONSTRAINT pjsip_media_encryption_values CHECK (media_encryption IN ('no', 'sdes', 'dtls')), 
    CONSTRAINT yesno_values CHECK (inband_progress IN ('yes', 'no')), 
    CONSTRAINT yesno_values CHECK (fax_detect IN ('yes', 'no')), 
    CONSTRAINT yesno_values CHECK (t38_udptl IN ('yes', 'no')), 
    CONSTRAINT pjsip_t38udptl_ec_values CHECK (t38_udptl_ec IN ('none', 'fec', 'redundancy')), 
    CONSTRAINT yesno_values CHECK (t38_udptl_nat IN ('yes', 'no')), 
    CONSTRAINT yesno_values CHECK (t38_udptl_ipv6 IN ('yes', 'no')), 
    CONSTRAINT yesno_values CHECK (one_touch_recording IN ('yes', 'no')), 
    CONSTRAINT yesno_values CHECK (allow_transfer IN ('yes', 'no')), 
    CONSTRAINT yesno_values CHECK (allow_subscribe IN ('yes', 'no')), 
    CONSTRAINT pjsip_dtls_setup_values CHECK (dtls_setup IN ('active', 'passive', 'actpass')), 
    CONSTRAINT yesno_values CHECK (srtp_tag_32 IN ('yes', 'no'))
);

GO

CREATE INDEX ps_endpoints_id ON ps_endpoints (id);

GO

CREATE TABLE ps_auths (
    id VARCHAR(40) NOT NULL, 
    auth_type VARCHAR(8) NULL, 
    nonce_lifetime INTEGER NULL, 
    md5_cred VARCHAR(40) NULL, 
    password VARCHAR(80) NULL, 
    realm VARCHAR(40) NULL, 
    username VARCHAR(40) NULL, 
    UNIQUE (id), 
    CONSTRAINT pjsip_auth_type_values CHECK (auth_type IN ('md5', 'userpass'))
);

GO

CREATE INDEX ps_auths_id ON ps_auths (id);

GO

CREATE TABLE ps_aors (
    id VARCHAR(40) NOT NULL, 
    contact VARCHAR(40) NULL, 
    default_expiration INTEGER NULL, 
    mailboxes VARCHAR(80) NULL, 
    max_contacts INTEGER NULL, 
    minimum_expiration INTEGER NULL, 
    remove_existing VARCHAR(3) NULL, 
    qualify_frequency INTEGER NULL, 
    authenticate_qualify VARCHAR(3) NULL, 
    UNIQUE (id), 
    CONSTRAINT yesno_values CHECK (remove_existing IN ('yes', 'no')), 
    CONSTRAINT yesno_values CHECK (authenticate_qualify IN ('yes', 'no'))
);

GO

CREATE INDEX ps_aors_id ON ps_aors (id);

GO

CREATE TABLE ps_contacts (
    id VARCHAR(40) NOT NULL, 
    uri VARCHAR(40) NULL, 
    expiration_time VARCHAR(40) NULL, 
    qualify_frequency INTEGER NULL, 
    UNIQUE (id)
);

GO

CREATE INDEX ps_contacts_id ON ps_contacts (id);

GO

CREATE TABLE ps_domain_aliases (
    id VARCHAR(40) NOT NULL, 
    domain VARCHAR(80) NULL, 
    UNIQUE (id)
);

GO

CREATE INDEX ps_domain_aliases_id ON ps_domain_aliases (id);

GO

CREATE TABLE ps_endpoint_id_ips (
    id VARCHAR(40) NOT NULL, 
    endpoint VARCHAR(40) NULL, 
    match VARCHAR(80) NULL, 
    UNIQUE (id)
);

GO

CREATE INDEX ps_endpoint_id_ips_id ON ps_endpoint_id_ips (id);

GO

INSERT INTO alembic_version (version_num) VALUES ('43956d550a44');

GO

COMMIT;

