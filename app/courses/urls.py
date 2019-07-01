from django.urls import path, re_path
from . import views

app_name = 'course'
urlpatterns = [
    path('', views.ListCourseView.as_view(), name='course-list'),
    path('list', views.CourseListView.as_view(), name='course-list'),
    re_path('(?P<pk>\d+)/$', views.RetrieveUpdateDestroyCourse.as_view(), name='course-detail'),
    re_path('(?P<course_pk>\d+)/reviews/$', views.ReviewListView.as_view(), name='review-list'),
    re_path('(?P<course_pk>\d+)/reviews/(?P<pk>\d+)/$',
            views.RetrieveUpdateDestroyReview.as_view(), name='review-detail'),

]