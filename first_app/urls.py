from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('<int:id>', views.polls, name='polls'),
    path('/formpage', views.formpage, name='formpage')

]
