from django.shortcuts import render
from rest_framework import generics

# Create your views here.
from .serializers import SongsSerializer
from .models import Songs


class SongListView(generics.ListAPIView):
    queryset = Songs.objects.all()
    serializer_class = SongsSerializer



