
* Disable Kernel Modules
  * Load Modules : `modprobe pcspkr`
  * List all Modules: `lsmod`
  * Blacklist Modules: 
    ```sh
    Edit `/etc/modeprobe.d/blacklist.conf`
    Add entry `blacklist sctp`
    restart the node `shutdown -r now`
    Review loading : lsmod | grep -i sctp
    ```
* Disable Open Ports on Nodes
  * netstat -anpt | grep -w LISTEN
  * Service file shows what services & ports are in use: cat `/etc/services` 
