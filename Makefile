up:
	docker-compose up -d app web db api-doc

down:
	docker-compose down

build:
	docker-compose build

create-project:
	docker-compose exec app composer create-project --prefer-dist "laravel/laravel=6.*" .

# dockerコンテナを初めて起動した場合に実行する
app-init:
	docker-compose exec app ash -c ' \
		chmod -R 777 /app/storage && \
		composer install && \
		php artisan storage:link && \
		php artisan key:generate && \
		php artisan jwt:secret --force && \
		php artisan webpush:vapid'

# Laravelのキャッシュ周りを削除する際に実行する
app-clear:
	docker-compose exec app composer dump-autoload
	docker-compose exec app php artisan optimize:clear

# シェルに入る
app-sh:
	docker-compose exec app bash

# tinker使うよ
app-tinker:
	docker-compose exec app php artisan tinker

# キューワーカー
app-queue:
	docker-compose exec app php artisan queue:listen

# composer installするだけ
app-composer-install:
	docker-compose exec app composer install

# composer updateするだけ
app-composer-update:
	docker-compose exec app composer update

# PHPの構文チェックする
app-phpcs:
	docker-compose exec app composer phpcs

# PHPの構文を修正する
app-phpcbf:
	docker-compose exec app composer phpcbf

# PHPの静的構文解析する
app-phpstan:
	docker-compose exec app composer phpstan

# PHPUnitでテストするよ
app-phpunit:
	docker-compose exec app composer phpunit

# Laravelのide-helper周りをまとめて実行してくれる
app-ide-helper:
	docker-compose exec app ash -c ' \
		php artisan ide-helper:eloquent && \
		php artisan ide-helper:models --nowrite && \
		php artisan ide-helper:generate && \
		php artisan ide-helper:meta'

# ゲストの/app/vendor配下のファイルをホストに同期する際に実行する
# appコンテナが起動している状態で実行すること
app-sync-vendor:
	mkdir -p ./src/vendor
	docker cp `docker-compose ps -q app`:/app/vendor/. ./src/vendor

# DBをリフレッシュする
app-db-fresh:
	docker-compose exec app ash -c ' \
		php artisan migrate:fresh && \
		php artisan migrate:fresh --env=testing'

# DBをリフレッシュしてSeederを流す、testingには流さない
app-db-fresh-seed:
	docker-compose exec app ash -c ' \
		php artisan migrate:fresh --seed && \
		php artisan migrate:fresh --env=testing'

# routeを見るよ
app-route:
	docker-compose exec app ash -c ' \
		php artisan route:list'

# modelを作成するよ
app-make-model:
	docker-compose exec app ash -c '\
		php artisan make:model Entities/Hoge'

# DB

# DB コンテナのシェルに入る
db-sh:
	docker-compose exec db bash

# MySQL のクエリログを垂れ流す
db-query-log:
	docker-compose exec db tail -f /var/log/mysql/query.log

# DBのドキュメントを更新する
doc-db-update:
	rm -rf ./document/dbdoc/*
	docker-compose up db-doc
