FROM        k021/base
MAINTAINER  joo2theeon@gmail.com

# 이게 없으면 pip package 설치 중 몇 개가 안 되는 경우가 있다
ENV         LANG C.UTF-8

# 프로젝트 폴더를 컨테이너 내의 /srv/app 에 복사
WORKDIR     /srv/app
COPY        . /srv/app

# pyenv virtualenv 설정 후 requirements 설치
RUN         pyenv local app
RUN         /root/.pyenv/versions/app/bin/pip install -r /srv/app/requirements.txt

# log dir
RUN         mkdir -p /var/log/uwsgi/app
RUN         mkdir -p /var/log/celery/app

# manage.py
WORKDIR     /srv/app/mrxob
EXPOSE      8000
CMD         ["/root/.pyenv/versions/app/bin/python", "manage.py", "runserver", "0.0.0.0:8000"]