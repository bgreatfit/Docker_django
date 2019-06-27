from django.urls import path, re_path
from . import views

app_name = 'course'
urlpatterns = [
    path('list', views.CourseListView.as_view(), name='course-list'),
    re_path('(?P<pk>\d+)/$', views.RetrieveUpdateDestroyCourse.as_view(), name='course-list')

]