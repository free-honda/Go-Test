# ベースイメージ
FROM golang:1.19-alpine

# 作業ディレクトリを設定
WORKDIR /usr/src/app

# モジュール依存関係をキャッシュ
COPY go.mod go.sum ./
RUN go mod download

# アプリケーションコードをコピー
COPY . .

# アプリケーションをビルド（静的バイナリ化 & 実行権限）
RUN CGO_ENABLED=0 go build -o app && chmod +x app

# ビルド後のファイル確認
RUN ls -l app

# コンテナ実行時のエントリーポイント（確認）
CMD ["./app"]
