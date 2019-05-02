파이썬 가상환경 대신 도커를 이용해 장고 프로젝트를 실행한다.  
PostgreSQL과 ReactJS 등도 함께 구성해본다.

## step
### 장고프로젝트 생성
`pie`라는 장고 프로젝트를 만든다고 가정하고 아래 명령어들을 터미널에 입력한다.
- mkdir `pie`
- git clone git@github.com:dryben/boot-django-react-docker.git `pie`
- cd `pie`
- sudo docker-compose run web django-admin startproject `pie` /code/

### 데이터베이스 연결
`django` 디렉터리 안에 장고 프로젝트가 세팅되었다.  
`django/pie/settings.py`의 DATABASES 항목을 postgresql 정보로 수정한다. (앞서 docker-compose.yml에서 정의함)
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
터미널에 아래 명령어를 실행한다. 이후 localhost:8000으로 접속 가능하다.
- docker-compose up

## todo
- [x] Django, PostgreSQL
- [ ] DjangoRestFramework, React..
- [ ] ...

## ref
- https://docs.docker.com/compose/django/
- https://www.44bits.io/ko/post/almost-perfect-development-environment-with-docker-and-docker-compose