# docker-kanboard
KanBoard wrapped in Docker for deployment with Postgres container, GitLab OAuth and SMTP mailing (mostly insecure..)

*Based on official stable image ;)*

## Application registration in GitLab
The process of app registration is provided by [GitLab Docs](http://doc.gitlab.com/ce/integration/oauth_provider.html) ;)

HINT: application callback URL is ```http://<your_private_kanban.tld>/oauth/gitlab```

## Postgres
```
mkdir -p /srv/postgres
docker run -d --name postgres -v /srv/postgres:/var/lib/postgresql/data -e POSTGRES_USER=kanboard -e POSTGRES_PASSWORD=kanboard postgres
```

## Kanboard
```
mkdir -p /srv/kanboard
docker run -d --name kanboard -p 80:80 --link postgres:postgres -v /srv/kanboard:/var/www/html/data -e 'MAIL_FROM=kanboard@<your_domain>' -e 'SMTP_HOST=<your_inernal_smtp>' -e 'GITLAB_OAUTH_ID=<your_app_id_from_gitlab>' -e 'GITLAB_OAUTH_SECRET=<your_app_secret_from_gitlab>' -e 'GITLAB_OAUTH_ENDPOINT=<your_base_gitlab_url_with_protocol>' blufor/kanboard:latest
```

## TODO
- **Encryption** !
