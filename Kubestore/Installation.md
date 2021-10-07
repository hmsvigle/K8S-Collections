
## 1. Install Krew

```sh
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.tar.gz" &&
  tar zxvf krew.tar.gz &&
  KREW=./krew-"$(uname | tr '[:upper:]' '[:lower:]')_$(uname -m | sed -e 's/x86_64/amd64/' -e 's/arm.*$/arm/')" &&
  "$KREW" install krew
  export PATH=$PATH:/home/centos/.krew/bin
```
 * Verify krew installation
 ```sh
[centos@ip-10-0-1-249 ~]$ kubectl krew
krew is the kubectl plugin manager.
You can invoke krew through kubectl: "kubectl krew [command]..."

Usage:
  kubectl krew [command]

Available Commands:
  help        Help about any command
  index       Manage custom plugin indexes
  info        Show information about an available plugin
  install     Install kubectl plugins
  list        List installed kubectl plugins
  search      Discover kubectl plugins
  uninstall   Uninstall plugins
  update      Update the local copy of the plugin index
  upgrade     Upgrade installed plugins to newer versions
  version     Show krew version and diagnostics

Flags:
  -h, --help      help for krew
  -v, --v Level   number for the log level verbosity

Use "kubectl krew [command] --help" for more information about a command.

 ```
 
## 2. Install kube-score & Verify Installation

```sh
[centos@ip-10-0-1-249 ~]$ kubectl krew install score
[centos@ip-10-0-1-249 ~]$ kubectl-score
Usage of kubectl score:
kubectl score [action] --flags

Actions:
        score   Checks all files in the input, and gives them a score and recommendations
        list    Prints a CSV list of all available score checks
        version Print the version of kube-score
        help    Print this message

Run "kubectl score [action] --help" for more information about a particular command

```

  * `kubectl-score` OR `kubectl score` both works as the executable for kube-score.
  * `kubectl-score` usage as below 
  
```sh
[centos@ip-10-0-1-249 ~]$ kubectl-score help
Usage of kubectl score:
kubectl score [action] --flags

Actions:
        score   Checks all files in the input, and gives them a score and recommendations
        list    Prints a CSV list of all available score checks
        version Print the version of kube-score
        help    Print this message

Run "kubectl score [action] --help" for more information about a particular command
```
  * `kubectl score` Suage as below
```sh
[centos@ip-10-0-1-249 ~]$ kubectl score help
Usage of kubectl score:
kubectl score [action] --flags

Actions:
        score   Checks all files in the input, and gives them a score and recommendations
        list    Prints a CSV list of all available score checks
        version Print the version of kube-score
        help    Print this message
```
 
 ## 3. [Usage](./Readme.md) of kubectl-score tool to generate HealthCheck Status Report
 
  
