파이썬 가상환경 대신 도커를 이용해 장고 프로젝트를 띄워봅니다.  
docker-compose를 활용해 PostgreSQL과 ReactJS 환경도 같이 구성할 예정입니다.

## step
### 장고프로젝트 생성
`pie`라는 장고 프로젝트를 만든다고 가정하고 아래 명령어들을 터미널에 입력합니다.
- mkdir `pie`
- git clone git@github.com:dryben/boot-django-react-docker.git `pie`
- cd `pie`
- sudo docker-compose run web django-admin startproject `pie` /code/

### 데이터베이스 연결
`django` 디렉터리 안에 장고 프로젝트가 세팅되었습니다.  
`django/pie/settings.py`의 DATABASES 항목을 postgresql 정보로 수정합니다.  
(앞서 docker-compose.yml에서 정의한 내용입니다.)
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'HOST': os.environ.get('DJANGO_DB_HOST'),
        'PORT': os.environ.get('DJANGO_DB_PORT'),
        'NAME': os.environ.get('DJANGO_DB_NAME'),
        'USER': os.environ.get('DJANGO_DB_USERNAME'),
        'PASSWORD': os.environ.get('DJANGO_DB_PASSWORD'),
    }
}
```

### 컨테이터 실행
터미널에 아래 명령어를 입력합니다. 컨테이너가 실행되면 localhost:8000으로 접속 가능합니다.
- docker-compose up
컨테이너 환경 안으로 들어가려면 아래 명령어를 쓸 수 있습니다.
- docker-compose exec web bash

## todo
- [x] Django, PostgreSQL
- [ ] DjangoRestFramework, React..
- [ ] ...

## ref
- https://docs.docker.com/compose/django/
- https://www.44bits.io/ko/post/almost-perfect-development-environment-with-docker-and-docker-compose