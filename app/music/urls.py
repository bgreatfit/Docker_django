from django.urls import path
from . import views

app_name = 'music'
urlpatterns = [
    # path('', views.index, name='index'),
    # path('<int:question_id>/', views.detail, name='detail'),
    # # ex: /polls/5/results/
    # path('<int:question_id>/results/', views.results, name='results'),
    # ex: /polls/5/vote/
    path('songs', views.SongListView.as_view(), name='index'),
]