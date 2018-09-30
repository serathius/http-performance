###############################################################################
# SETTINGS
###############################################################################
import os
import time

from django.apps import apps
from django.conf import settings
from django.core.wsgi import get_wsgi_application
from django import http
from django.views.generic import View


BASE_DIR = os.path.dirname(os.path.dirname(os.path.dirname(__file__)))

if not settings.configured:
    settings.configure(
        DEBUG=True,
        SECRET_KEY='thisisthesecretkey',
        ROOT_URLCONF=__name__,
        STATIC_URL='/static/',
        STATICFILES_DIRS=(
            os.path.join(BASE_DIR, "static"),
        ),
        MIGRATION_MODULES = {'__main__': 'migrations'},
        MIDDLEWARE_CLASSES=(
        ),
        DATABASES = {
            'default': {
                'ENGINE': 'django.db.backends.sqlite3',
                'NAME': 'tinydb',
            }
        },
        INSTALLED_APPS = (
            '__main__',
        ),
    )

apps.populate(settings.INSTALLED_APPS)


###############################################################################
# VIEWS
###############################################################################




class HelloView(View):
    def get(self, request, *args, **kwargs):
        return http.HttpResponse("Hello, World")


class WorkView(View):
    def get(self, request, *args, **kwargs):
        stop = time.time() + 0.0075
        result = 0
        while stop > time.time():
            for i in range(10000):
                result += 1
        return http.HttpResponse("")


class SleepView(View):
    def get(self, request, *args, **kwargs):
        stop = time.time() + 0.0075
        while stop > time.time():
            time.sleep(0.0005)
        return http.HttpResponse("")


class TransferView(View):
    def get(self, request, *args, **kwargs):
        return http.HttpResponse(data)

###############################################################################
# URLCONF
###############################################################################
from django.conf.urls import url, include


urlpatterns = (
    url(r'^$', HelloView.as_view(), name="hello"),
    url(r'^work$', WorkView.as_view(), name="work"),
    url(r'^sleep$', SleepView.as_view(), name="sleep"),
    url(r'^transfer$', TransferView.as_view(), name="transfer"),
)


###############################################################################
# MANAGE
###############################################################################

app = get_wsgi_application()


if os.environ.get("SERVER") == 'bjoern':
    import bjoern
    bjoern.run(app, '127.0.0.1', 8000)

if os.environ.get("SERVER") == 'netius':
    import netius.servers
    server = netius.servers.WSGIServer(app=app)
    server.serve(port = 8000)

if os.environ.get("SERVER") == 'waitress':
    from waitress import serve
    serve(app, listen='*:8000')