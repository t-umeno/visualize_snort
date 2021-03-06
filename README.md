# visualize_snort
## ELK6
* install ELK6 with snort, curl and wireshark on ubuntu/xenial64
### requirements
* VirtualBox
* Vagrant
* vagrant plugin install vagrant-disksize
* vagrant plugin install vagrant-proxyconf (if you use proxy)
* vagrant plugin install vagrant-vbguest (option)

### install
Please set http_proxy and https_proxy if you need.

    $ export http_proxy="http://aaa.bbb.ccc.ddd:8080/" # if you use proxy
    $ export https_proxy="http://aaa.bbb.ccc.ddd:8080/" # if you use proxy
    $ vagrant plugin install vagrant-proxyconf # if you use proxy
    $ vagrant plugin install vagrant-vbguest # option
    $ vagrant plugin install vagrant-disksize
    $ cd ansible/ELK6/playbooks
    $ vagrant up
    (snip)
    (select network interface for snort)
    ==> default: Available bridged network interfaces:
    1) en1: Wi-Fi (AirPort)
    2) bridge0
    3) en0: Ethernet
    4) en2: Thunderbolt 1
    5) p2p0
    ==> default: When choosing an interface, it is usually the one that is
    ==> default: being used to connect to the internet.
        default: Which interface should the network bridge to? 3

### usage (kibana)
Please use firefox or chrome.
- open http://127.0.0.1:5601/
- select "Management"
- select "Index Patterns"
- select "Create Index Pattern"
- input "snort.*" in index pattern
- select "@timestamp" in Time Filter field name
- push "Create index pattern"
- select "Management"
- select "Saved Objects"
- push "Import"
- File Upload: kibana6/export.json
- push "No, prompt for each object"
- select "snort.*" as "New index pattern"
- push "Confirm all changes"
- select "Dashboard"
- select "snort" or "snort2"
- enjoy!

### usage (grafana)
- open http://127.0.0.1:3000/
- login (username: admin password: admin)
- change password
- push "Add data source"
- input "snort" in Name
- select "Elasticsearch" in Type
- input "http://localhost:9200" in URL
- input "snort.*" in Elasticsearch details Index Name
- select "5.6+" in Elasticsearch deaiils Version
- push "Save & Test"
- select "+" and "Import"
- push "Upload .json File"
- upload "grafana/snort_count.json"
- select "snort" from "Select a Elasticsearch data source"
- push "Import"
- enjoy!

### ToDo
- document
