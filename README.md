# gomqtttest

MQTT を試してみるためのリポジトリです。

## MQTT Broker の起動

リポジトリルートで、以下のコマンドを入力します。
```bash
$ ./bin/run_docker_ssl.sh
```

mosquitto-ssl というイメージから docker container が立ち上がります。  
ポート 8883 で待ち受ける MQTT Broker になります。要 SSL 。  
証明書は本リポジトリに同梱の `./mosquitto_config/ca.crt` を読み込むようになっています。

## MQTT Broker の停止

docker stop コマンドで止めます。

```bash
$ docker stop mosquitto-ssl
```

## MQTT Client 側のあれこれ

MQTT Broker は要 SSL の状態で立ち上がっているので、Client は接続にあたって証明書と鍵が必要です。  
同梱の `./mosquitto_config/generate-CA.sh` を用いて、証明書と鍵を生成します。  
以下のようにコマンドを入力します。  
```bash
$ cd ./mosquitto_config
$ ./generate-CA.sh client {Client の ID}
```
{Client の ID}.crt と {Client の ID}.key が生成されます。

## MQTT Client のビルド

`go build` します。実行バイナリ `gomqtttest` が生成されます。

```bash
# リポジトリのルートディレクトリで
$ go build
```

## MQTT Client の実行

MQTT Broker が動いている状態で、`gomtttest` を実行します。  
動作確認のための subscribe と publish が自動で数回行われます。


