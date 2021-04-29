# ogp_backend

## directory tree

```
├── Makefile
├── docker
│   ├── nginx
│   │   ├── Dockerfile
│   │   └── default.conf
│   ├── php
│   │   ├── Dockerfile
│   │   └── php.ini
│   └── tbls
│       └── Dockerfile
├── docker-compose.yml
├── document
│   ├── dbdoc
│   │   ├── README.md
│   │   └── schema.svg
│   └── openapi
│       ├── docs
│       │   ├── Apis
│       │   │   └── AdminApi.md
│       │   └── README.md
│       ├── generated
│       │   ├── README.md
│       │   └── openapi.json
│       ├── package-lock.json
│       ├── package.json
│       ├── paths
│       │   └── health-check.yml
│       └── root.yml
└── src
    ├── README.md
    ├── app
    │   ├── Console
    │   │   └── Kernel.php
    │   ├── Exceptions
    │   │   └── Handler.php
    │   ├── Http
    │   │   ├── Controllers
    │   │   │   ├── Auth
    │   │   │   │   ├── ConfirmPasswordController.php
    │   │   │   │   ├── ForgotPasswordController.php
    │   │   │   │   ├── LoginController.php
    │   │   │   │   ├── RegisterController.php
    │   │   │   │   ├── ResetPasswordController.php
    │   │   │   │   └── VerificationController.php
    │   │   │   └── Controller.php
    │   │   ├── Kernel.php
    │   │   └── Middleware
    │   │       ├── Authenticate.php
    │   │       ├── CheckForMaintenanceMode.php
    │   │       ├── EncryptCookies.php
    │   │       ├── RedirectIfAuthenticated.php
    │   │       ├── TrimStrings.php
    │   │       ├── TrustProxies.php
    │   │       └── VerifyCsrfToken.php
    │   ├── Providers
    │   │   ├── AppServiceProvider.php
    │   │   ├── AuthServiceProvider.php
    │   │   ├── BroadcastServiceProvider.php
    │   │   ├── EventServiceProvider.php
    │   │   └── RouteServiceProvider.php
    │   └── User.php
    ├── artisan
    ├── bootstrap
    │   ├── app.php
    │   └── cache
    │       ├── packages.php
    │       └── services.php
    ├── composer.json
    ├── composer.lock
    ├── config
    │   ├── app.php
    │   ├── auth.php
    │   ├── broadcasting.php
    │   ├── cache.php
    │   ├── cors.php
    │   ├── database.php
    │   ├── filesystems.php
    │   ├── hashing.php
    │   ├── logging.php
    │   ├── mail.php
    │   ├── queue.php
    │   ├── services.php
    │   ├── session.php
    │   └── view.php
    ├── database
    │   ├── factories
    │   │   └── UserFactory.php
    │   ├── migrations
    │   │   ├── 2014_10_12_000000_create_users_table.php
    │   │   ├── 2014_10_12_100000_create_password_resets_table.php
    │   │   └── 2019_08_19_000000_create_failed_jobs_table.php
    │   └── seeds
    │       └── DatabaseSeeder.php
    ├── package.json
    ├── phpunit.xml
    ├── public
    │   ├── favicon.ico
    │   ├── index.php
    │   ├── robots.txt
    │   └── web.config
    ├── resources
    │   ├── js
    │   │   ├── app.js
    │   │   └── bootstrap.js
    │   ├── lang
    │   │   └── en
    │   │       ├── auth.php
    │   │       ├── pagination.php
    │   │       ├── passwords.php
    │   │       └── validation.php
    │   ├── sass
    │   │   └── app.scss
    │   └── views
    │       └── welcome.blade.php
    ├── routes
    │   ├── api.php
    │   ├── channels.php
    │   ├── console.php
    │   └── web.php
    ├── server.php
    ├── storage
    │   ├── app
    │   │   └── public
    │   ├── framework
    │   │   ├── cache
    │   │   │   └── data
    │   │   ├── sessions
    │   │   │   └── ngA32EiWoacxqbMAur7ylcA3BoJfuELDgc0vu6SM
    │   │   ├── testing
    │   │   └── views
    │   │       └── 8a232580639f5a7a06b1d497d0825c281c17c91d.php
    │   └── logs
    ├── tests
    │   ├── CreatesApplication.php
    │   ├── Feature
    │   │   └── ExampleTest.php
    │   ├── TestCase.php
    │   └── Unit
    │       └── ExampleTest.php
    └── webpack.mix.js
```
