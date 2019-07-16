# wordpress用のサーバーを構築する！！！
※各項に"${env}"が出てきますが、~/.aws/credentialに記載されている環境を指定してください。  

目次
```
0. 前準備
1. networkの作成（network.mk）
2. EC2の作成(wordpress.mk)
3. SSL証明書、route53ホストゾーンの作成（wordpress-ssl.mk）
4. applicationLoadBalancerの作成（wordpress-alb.mk）
5. route53レコードセットの作成（wordpress-route53.mk）
```

## 0. 前準備
### terraformのインストール
v0.11.13で動作確認を行っています。v0.12以上では動きません。
```
brew uninstall terraform
brew install tfenv
tfenv install 0.11.13
※terraformがuninstallされてないとtfenvは入れられなかったはず。。
terrform -v(version確認)
```

### bucketの作成
```
以下のbucketを手動で作成しておくこと。
※key-pairやtfstateを理解していない方は、とりあえずex.)の内容で作ってください。
・key-pair保存用（ex.)mk-keypair）
・terraformのstateファイル保存用（ex.)mk-terraform-state）
```

### domainの取得
```
route53であらかじめ、自分のサイトに使用するドメインを取得する。  
https://console.aws.amazon.com/route53/home#DomainListing:  
※ムームードメインやお名前.comで取らずに必ずroute53上でドメインを取得すること。
```

## 1. networkの作成
プロジェクトのルートディレクトリで以下コマンドを順番に実行する。
```
make network-remote ENV=${env}
make network-create ENV=${env}
make network-plan ENV=${env}
make network-apply ENV=${env}
applyコマンドでは途中入力を求められる。yesを入力すれば適用
```

## 2. EC2の作成
プロジェクトのルートディレクトリで以下コマンドを順番に実行する。
```
./scripts/create_keypair_wordpress_server.sh ${env}
make wordpress-remote ENV=${env}
make wordpress-create ENV=${env}
make wordpress-plan ENV=${env}
make wordpress-apply ENV=${env}
applyコマンドでは途中入力を求められる。yesを入力すれば適用
```

## 3. SSL証明書、route53ホストゾーンの作成
プロジェクトのルートディレクトリで以下コマンドを順番に実行する。
```
make wordpress-ssl-remote ENV=${env}
make wordpress-ssl-create ENV=${env}
make wordpress-ssl-plan ENV=${env}
make wordpress-ssl-apply ENV=${env}
applyコマンドでは途中入力を求められる。yesを入力すれば適用

この後やること２つ
・前準備で取得したドメインのネームサーバ変更
・SSL証明書のDNS承認
```

### 前準備で取得したドメインのネームサーバ変更
以下のroute53のコンソール画面より、3.で作成されたホストソーンを選択してください。  
https://console.aws.amazon.com/route53/home#hosted-zones:  

タイプ"NS"のところをみると以下のような値が設定されていると思う。これをメモ
```
ns-1062.awsdns-04.org.
ns-946.awsdns-54.net.
ns-430.awsdns-53.com.
ns-1885.awsdns-43.co.uk.
```

次に以下の画面で対象のドメインを選択する。  
https://console.aws.amazon.com/route53/home#DomainListing:

ドメインの詳細画面に遷移したら、ネームサーバーの追加/編集というリンクがあるので、それを押下。  
そこでメモしておいた、上の値を入れる。

### SSL証明書のDNS承認
以下の画面を開いて、"route53でのレコード作成"ボタンを押下する。簡単なのでわからなかったらググって  
https://ap-northeast-1.console.aws.amazon.com/acm/home?region=ap-northeast-1#/  
※数分経てば、無事証明書の状況が"検証中"→"発行済み"に変わる。  
変わったらalbの作成ができるようになります。

## 4. applicationLoadBalancerの作成
プロジェクトのルートディレクトリで以下コマンドを順番に実行する。
```
make wordpress-alb-remote ENV=${env}
make wordpress-alb-create ENV=${env}
make wordpress-alb-plan ENV=${env}
make wordpress-alb-apply ENV=${env}
applyコマンドでは途中入力を求められる。yesを入力すれば適用
```

## 5. route53レコードセットの作成
プロジェクトのルートディレクトリで以下コマンドを順番に実行する。
```
make wordpress-route53-remote ENV=${env}
make wordpress-route53-create ENV=${env}
make wordpress-route53-plan ENV=${env}
make wordpress-route53-apply ENV=${env}
applyコマンドでは途中入力を求められる。yesを入力すれば適用
```

これで完成。https://${domain_name}でwordpressの自分の画面がでるぞ！  
わからないことあったら気軽にメールして"kubota.masataka358@gmail.com"# aws-wordpress-infra
