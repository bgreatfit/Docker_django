from django.urls import path, re_path
from . import views

app_name = 'course'
urlpatterns = [
    path('', views.api_root),
    path('users', views.UserList.as_view(), name='user-list'),
    path('users/<int:pk>/', views.UserDetail.as_view(), name='user-detail'),
    path('courses', views.CourseListView.as_view(), name='course-list'),
    # path('list', views.CourseListView.as_view(), name='course-list'),
    re_path('courses/(?P<pk>\d+)/$', views.RetrieveUpdateDestroyCourse.as_view(), name='course-detail'),
    re_path('courses/(?P<course_pk>\d+)/reviews/$', views.ListCreateReview.as_view(), name='review-list'),
    re_path('courses/(?P<course_pk>\d+)/reviews/(?P<pk>\d+)/$',
            views.RetrieveUpdateDestroyReview.as_view(), name='review-detail'),

]