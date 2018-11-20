# visualize_network_traffic
snortのログを可視化します。

## ELK6
VagrantでsnortのログをKibanaやGrafanaで表示するVMを作成します。
VMは100GBの仮想ディスクと8GBの仮想メモリを使用します。
* NICから受信したパケットをsnortで検査します。
* snortのログをLogstash経由でElasticsearchに入力します。
* KibanaやGrafanaでElasticsearchに入力されたsnortのログを表示します。
* curlやwiresharkなどパケットの解析に用いるソフトウェアもインストールします。
### 事前にインストールするソフトウェア
* VirtualBox
* Vagrant
* vagrant plugin install vagrant-disksize
* vagrant plugin install vagrant-proxyconf (if you use proxy)
* vagrant plugin install vagrant-vbguest (option)

### install
必要に応じてhttp_proxy, https_proxyの環境変数を設定してください。

    $ export http_proxy="http://aaa.bbb.ccc.ddd:8080/" # if you use proxy
    $ export https_proxy="http://aaa.bbb.ccc.ddd:8080/" # if you use proxy
    $ vagrant plugin install vagrant-disksize
    $ vagrant plugin install vagrant-proxyconf # if you use proxy
    $ vagrant plugin install vagrant-vbguest # option
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

### 使用方法 (kibana)
- http://127.0.0.1:5601/ をfirefox, chromeなどのブラウザで開きます。
- "Management" を選択します
- "Index Patterns" を選択します。
- "Create Index Pattern" を選択します。
- index pattern に "snort.*" を入力します。
- Time Filter field name から "@timestamp" を選択します。
- "Create index pattern" を押します。
- "Management" を選択します。
- "Saved Objects" を選択します。
- "Import" を押します。
- kibana6/export.json をアップロードします。
- "No, prompt for each object" を押します。
- "snort.*" as "New index pattern" を選択します。
- "Confirm all changes" を押します。
- "Dashboard" を選択します。
- "snort" もしくは "snort2" を選択します。
- ダッシュボードにネットワークのトラフィック情報が表示されます。

### 使用方法 (grafana)
- http://127.0.0.1:3000/ をブラウザで開きます。
- username: admin password: admin でログインします。
- パスワードを変更します。
- "Add data source" を押します。
- Name に "snort" を入力します。
- Type から "Elasticsearch" を選択します。
- URL に "http://localhost:9200" を入力します。
- Elasticsearch details の Index Name に "snort.*" を入力します。
- Elasticsearch deaiils の Versionselect から "5.6+" を選択します。
- "Save & Test" を押します。
- "+" を押し、 "Import" を選択します。
- "Upload .json File" を押します。
- "grafana/snort_count.json" をアップロードします。
- "Select a Elasticsearch data source" から "snort" を選択します。
- "Import" を押します。
- snort count のダッシュボードが表示されます。count について表示します。

### ToDo
- ドキュメント
