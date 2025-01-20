# ベースイメージ
FROM golang:1.19-alpine

# 作業ディレクトリを設定
WORKDIR /usr/src/app

# モジュール依存関係をキャッシュ
COPY go.mod go.sum ./
RUN go mod download

# アプリケーションコードをコピー
COPY . .

# アプリケーションをビルド
RUN go build -o app

# コンテナ実行時のエントリーポイント
CMD ["./app"]
