### Links
https://restic.net/
https://restic.readthedocs.io/en/stable/030_preparing_a_new_repo.html
https://www.linuxpedia.pl/articles/restic-basics/
https://restic.readthedocs.io/en/latest/manual_rest.html
https://github.com/restic/rest-server
https://forum.restic.net/t/how-to-backup-a-server-without-running-restic-directly-on-it/1445/10

### Install and setup
```bash
sudo apt install restic
restic -r /mnt/gfs/restic init
restic -r /mnt/gfs/restic backup /mnt/d1/portainer
restic -r /mnt/gfs/restic snapshots
```

### Or add to bashrc
export RESTIC_REPOSITORY="/mnt/gfs/restic"
export RESTIC_PASSWORD="password"

### Usage help
https://restic.readthedocs.io/en/latest/manual_rest.html

Usage:
  restic [command]

Available Commands:
  backup        Create a new backup of files and/or directories
  cache         Operate on local cache directories
  cat           Print internal objects to stdout
  check         Check the repository for errors
  copy          Copy snapshots from one repository to another
  diff          Show differences between two snapshots
  dump          Print a backed-up file to stdout
  find          Find a file, a directory or restic IDs
  forget        Remove snapshots from the repository
  generate      Generate manual pages and auto-completion files (bash, fish, zsh, powershell)
  help          Help about any command
  init          Initialize a new repository
  key           Manage keys (passwords)
  list          List objects in the repository
  ls            List files in a snapshot
  migrate       Apply migrations
  mount         Mount the repository
  prune         Remove unneeded data from the repository
  recover       Recover data from the repository not referenced by snapshots
  repair        Repair the repository
  restore       Extract the data from a snapshot
  rewrite       Rewrite snapshots to exclude unwanted files
  self-update   Update the restic binary
  snapshots     List all snapshots
  stats         Scan the repository and show basic statistics
  tag           Modify tags on snapshots
  unlock        Remove locks other processes created
  version       Print version information

Flags:
      --cacert file                file to load root certificates from (default: use system certificates)
      --cache-dir directory        set the cache directory. (default: use system default cache directory)
      --cleanup-cache              auto remove old cache directories
      --compression mode           compression mode (only available for repository format version 2), one of (auto|off|max) (default: $RESTIC_COMPRESSION) (default auto)
  -h, --help                       help for restic
      --insecure-tls               skip TLS certificate verification when connecting to the repository (insecure)
      --json                       set output mode to JSON for commands that support it
      --key-hint key               key ID of key to try decrypting first (default: $RESTIC_KEY_HINT)
      --limit-download rate        limits downloads to a maximum rate in KiB/s. (default: unlimited)
      --limit-upload rate          limits uploads to a maximum rate in KiB/s. (default: unlimited)
      --no-cache                   do not use a local cache
      --no-lock                    do not lock the repository, this allows some operations on read-only repositories
  -o, --option key=value           set extended option (key=value, can be specified multiple times)
      --pack-size size             set target pack size in MiB, created pack files may be larger (default: $RESTIC_PACK_SIZE)
      --password-command command   shell command to obtain the repository password from (default: $RESTIC_PASSWORD_COMMAND)
  -p, --password-file file         file to read the repository password from (default: $RESTIC_PASSWORD_FILE)
  -q, --quiet                      do not output comprehensive progress report
  -r, --repo repository            repository to backup to or restore from (default: $RESTIC_REPOSITORY)
      --repository-file file       file to read the repository location from (default: $RESTIC_REPOSITORY_FILE)
      --retry-lock duration        retry to lock the repository if it is already locked, takes a value like 5m or 2h (default: no retries)
      --tls-client-cert file       path to a file containing PEM encoded TLS client certificate and private key
  -v, --verbose                    be verbose (specify multiple times or a level using --verbose=n, max level/times is 2)

Use "restic [command] --help" for more information about a command.

### Environment Variables
https://restic.readthedocs.io/en/latest/040_backup.html

In addition to command-line options, restic supports passing various options in environment variables. The following lists these environment variables:

RESTIC_REPOSITORY_FILE              Name of file containing the repository location (replaces --repository-file)
RESTIC_REPOSITORY                   Location of repository (replaces -r)
RESTIC_PASSWORD_FILE                Location of password file (replaces --password-file)
RESTIC_PASSWORD                     The actual password for the repository
RESTIC_PASSWORD_COMMAND             Command printing the password for the repository to stdout
RESTIC_KEY_HINT                     ID of key to try decrypting first, before other keys
RESTIC_CACERT                       Location(s) of certificate file(s), comma separated if multiple (replaces --cacert)
RESTIC_TLS_CLIENT_CERT              Location of TLS client certificate and private key (replaces --tls-client-cert)
RESTIC_CACHE_DIR                    Location of the cache directory
RESTIC_COMPRESSION                  Compression mode (only available for repository format version 2)
RESTIC_PROGRESS_FPS                 Frames per second by which the progress bar is updated
RESTIC_PACK_SIZE                    Target size for pack files
RESTIC_READ_CONCURRENCY             Concurrency for file reads

TMPDIR                              Location for temporary files

AWS_ACCESS_KEY_ID                   Amazon S3 access key ID
AWS_SECRET_ACCESS_KEY               Amazon S3 secret access key
AWS_SESSION_TOKEN                   Amazon S3 temporary session token
AWS_DEFAULT_REGION                  Amazon S3 default region
AWS_PROFILE                         Amazon credentials profile (alternative to specifying key and region)
AWS_SHARED_CREDENTIALS_FILE         Location of the AWS CLI shared credentials file (default: ~/.aws/credentials)

AZURE_ACCOUNT_NAME                  Account name for Azure
AZURE_ACCOUNT_KEY                   Account key for Azure
AZURE_ACCOUNT_SAS                   Shared access signatures (SAS) for Azure
AZURE_ENDPOINT_SUFFIX               Endpoint suffix for Azure Storage (default: core.windows.net)

B2_ACCOUNT_ID                       Account ID or applicationKeyId for Backblaze B2
B2_ACCOUNT_KEY                      Account Key or applicationKey for Backblaze B2

GOOGLE_PROJECT_ID                   Project ID for Google Cloud Storage
GOOGLE_APPLICATION_CREDENTIALS      Application Credentials for Google Cloud Storage (e.g. $HOME/.config/gs-secret-restic-key.json)

OS_AUTH_URL                         Auth URL for keystone authentication
OS_REGION_NAME                      Region name for keystone authentication
OS_USERNAME                         Username for keystone authentication
OS_USER_ID                          User ID for keystone v3 authentication
OS_PASSWORD                         Password for keystone authentication
OS_TENANT_ID                        Tenant ID for keystone v2 authentication
OS_TENANT_NAME                      Tenant name for keystone v2 authentication

OS_USER_DOMAIN_NAME                 User domain name for keystone authentication
OS_USER_DOMAIN_ID                   User domain ID for keystone v3 authentication
OS_PROJECT_NAME                     Project name for keystone authentication
OS_PROJECT_DOMAIN_NAME              Project domain name for keystone authentication
OS_PROJECT_DOMAIN_ID                Project domain ID for keystone v3 authentication
OS_TRUST_ID                         Trust ID for keystone v3 authentication

OS_APPLICATION_CREDENTIAL_ID        Application Credential ID (keystone v3)
OS_APPLICATION_CREDENTIAL_NAME      Application Credential Name (keystone v3)
OS_APPLICATION_CREDENTIAL_SECRET    Application Credential Secret (keystone v3)

OS_STORAGE_URL                      Storage URL for token authentication
OS_AUTH_TOKEN                       Auth token for token authentication

RCLONE_BWLIMIT                      rclone bandwidth limit

RESTIC_REST_USERNAME                Restic REST Server username
RESTIC_REST_PASSWORD                Restic REST Server password

ST_AUTH                             Auth URL for keystone v1 authentication
ST_USER                             Username for keystone v1 authentication
ST_KEY                              Password for keystone v1 authentication