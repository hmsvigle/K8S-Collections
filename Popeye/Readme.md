## Setup Popeye:

```sh
$ mkdir -p $HOME/popeye && cd $HOME/popeye
```
* Download popeye repo to home directory
```sh 
$ git clone https://github.com/derailed/popeye.git
$ ls -l /home/centos/popeye
```
* Install popeye
```sh
$ cd /home/centos/popeye
$ go install
[centos@ip-10-0-1-249 popeye]$ go install
go: downloading github.com/rs/zerolog v1.18.0
go: downloading k8s.io/client-go v0.18.8
go: downloading github.com/aws/aws-sdk-go v1.29.32
go: downloading k8s.io/cli-runtime v0.18.8
go: downloading k8s.io/apimachinery v0.18.8
go: downloading github.com/prometheus/client_golang v1.5.1
go: downloading k8s.io/api v0.18.8
go: downloading golang.org/x/net v0.0.0-20200202094626-16171245cfb2
go: downloading github.com/gogo/protobuf v1.3.1
go: downloading github.com/evanphx/json-patch v0.0.0-20200808040245-162e5629780b
go: downloading github.com/spf13/cobra v0.0.6
go: downloading k8s.io/metrics v0.18.8
go: downloading github.com/hashicorp/golang-lru v0.5.1
go: downloading github.com/fvbommel/sortorder v1.0.1
go: downloading github.com/prometheus/common v0.9.1
go: downloading github.com/googleapis/gnostic v0.1.0
go: downloading github.com/peterbourgon/diskv v2.0.1+incompatible
go: downloading github.com/spf13/pflag v1.0.5
go: downloading github.com/gregjones/httpcache v0.0.0-20180305231024-9cad4c3443a7
go: downloading github.com/golang/protobuf v1.3.2
go: downloading sigs.k8s.io/structured-merge-diff/v3 v3.0.0
go: downloading k8s.io/klog v1.0.0
go: downloading github.com/google/btree v1.0.0
go: downloading github.com/imdario/mergo v0.3.5
go: downloading golang.org/x/text v0.3.2
go: downloading github.com/beorn7/perks v1.0.1
go: downloading sigs.k8s.io/yaml v1.2.0
go: downloading github.com/google/gofuzz v1.1.0
go: downloading github.com/davecgh/go-spew v1.1.1
go: downloading k8s.io/utils v0.0.0-20200324210504-a9aa75ae1b89
go: downloading golang.org/x/crypto v0.0.0-20200220183623-bac4c82f6975
go: downloading github.com/prometheus/client_model v0.2.0
go: downloading github.com/gophercloud/gophercloud v0.1.0
go: downloading sigs.k8s.io/kustomize v2.0.3+incompatible
go: downloading github.com/Azure/go-autorest/autorest v0.10.0
go: downloading github.com/google/go-cmp v0.4.0
go: downloading github.com/matttproud/golang_protobuf_extensions v1.0.1
go: downloading golang.org/x/oauth2 v0.0.0-20190604053449-0f29369cfe45
go: downloading gopkg.in/yaml.v2 v2.2.8
go: downloading github.com/Azure/go-autorest/autorest/adal v0.8.2
go: downloading github.com/modern-go/reflect2 v1.0.1
go: downloading github.com/json-iterator/go v1.1.9
go: downloading golang.org/x/time v0.0.0-20190308202827-9d24e82272b4
go: downloading github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd
go: downloading github.com/prometheus/procfs v0.0.8
go: downloading github.com/pkg/errors v0.9.1
go: downloading github.com/Azure/go-autorest/tracing v0.5.0
go: downloading github.com/dgrijalva/jwt-go v3.2.0+incompatible
go: downloading github.com/Azure/go-autorest/autorest/date v0.2.0
go: downloading github.com/ghodss/yaml v1.0.0
go: downloading github.com/cespare/xxhash v1.1.0
go: downloading github.com/liggitt/tabwriter v0.0.0-20181228230101-89fcab3d43de
go: downloading github.com/cespare/xxhash/v2 v2.1.1
go: downloading github.com/Azure/go-autorest/logger v0.1.0
go: downloading github.com/go-openapi/spec v0.19.3
go: downloading golang.org/x/sys v0.0.0-20200122134326-e047566fdf82
go: downloading cloud.google.com/go v0.38.0
go: downloading k8s.io/kube-openapi v0.0.0-20200410145947-61e04a5be9a6
go: downloading github.com/go-openapi/jsonreference v0.19.3
go: downloading github.com/go-openapi/swag v0.19.5
go: downloading github.com/PuerkitoBio/purell v1.1.1
go: downloading github.com/go-openapi/jsonpointer v0.19.3
go: downloading github.com/PuerkitoBio/urlesc v0.0.0-20170810143723-de5bf2ad4578
go: downloading gopkg.in/inf.v0 v0.9.1
go: downloading github.com/mailru/easyjson v0.7.0
go: downloading github.com/emicklei/go-restful v2.9.5+incompatible
go: downloading github.com/jmespath/go-jmespath v0.0.0-20180206201540-c2b33e8439af

```

* Edit `bashrc` file with variables

```sh
  # Add below content to bashrc file
  export PATH=$PATH:/etc/go/bin
  export PATH=$PATH:/home/centos/go/bin/
  
  # source bashrc
  $ source ~/.bashrc
  
```
* Test popeye cli
```sh
$ popeye

```

![image](https://git.daimler.com/storage/user/3406/files/5b834380-3496-11eb-82f9-6a3bc3a06df4)
