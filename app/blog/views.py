from django.http import HttpResponse
from django.shortcuts import render
import os

# Create your views here.


def index(request):
    return HttpResponse(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
