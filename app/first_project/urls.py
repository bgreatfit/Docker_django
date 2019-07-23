"""first_project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf import settings
from django.contrib import admin
from django.urls import path, include, re_path
from rest_framework.routers import DefaultRouter,SimpleRouter
from . import views
from courses import views as course_view
#from first_project.app.courses import views
router = SimpleRouter()
router.register(r'courses', course_view.CourseViewSet)
router.register(r'reviews', course_view.ReviewViewSet)
router.register(r'users', course_view.UserViewSet)

if settings.DEBUG:
    import debug_toolbar
    urlpatterns = [
        path('__debug__/', include(debug_toolbar.urls)),

        path('admin/', admin.site.urls),
    ]
    urlpatterns += [
        # path('__debug__/', include(debug_toolbar.urls)),
        path('polls/', include('polls.urls')),
        # path('blog/', include('blog.urls')),
        path('catalog/', include('catalog.urls'))
    ]
    # Add Django site authentication urls (for login, logout, password management)
    urlpatterns += [
        path('accounts/', include('django.contrib.auth.urls')),
        path('signup/', views.signup),
        path('register/', views.Register.as_view(), name="register"),
    ]
    urlpatterns += [
        re_path('/api-auth/', include('rest_framework.urls', namespace='rest_framework')),
        ]

    urlpatterns += [
        re_path('/api/(?P<version>(v1|v2))/', include('music.urls')),
    ]
    urlpatterns += [
        re_path('api/v1/', include('courses.urls')),
    ]
    urlpatterns += [
        re_path('api/v2/', include((router.urls, 'course'), namespace='apiv2')),
    ]

    #Add Django site authentication urls (for login, logout, password management)
