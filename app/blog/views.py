import os
from django.http import HttpResponse
from django.shortcuts import render
from django.urls import reverse
from django.views import generic
from .models import Post,Comment

# Create your views here.


def index(request):
    return HttpResponse(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


class AboutView(generic.TemplateView):
    template_name = 'blogs.about.html'


class PostListView(generic.ListView):
    model = Post
    template_name = 'blogs.about.html'

    def get_queryset(self):
        return Post.objects.filter().order_by()


class PostDetailView(generic.ListView):
    model = Post
    template_name = 'blogs.about.html'

    def get_queryset(self):
        return Post.objects.filter().order_by()


class PostFormView(generic.ListView):
    model = Post
    template_name = 'blogs.about.html'

    def get_queryset(self):
        return Post.objects.filter().order_by()


class PostDeleteView(generic.ListView):
    model = Post
    template_name = 'blogs.about.html'

    def get_queryset(self):
        return Post.objects.filter().order_by()
