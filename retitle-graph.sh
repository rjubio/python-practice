PHP=`which php`
CAC_DIR="/ftp/netmon/cacti/cli"

$PHP $CAC_DIR/poller_reindex_hosts.php --id=$1
$PHP $CAC_DIR/poller_graphs_reapply_names.php -id=$1 -s="Traffic" 
