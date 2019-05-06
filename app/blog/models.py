from django.db import models
from django.urls import reverse
# Create your models here.
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey('auth.User')
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(default=timezone.now())
    publish_date = models.DateTimeField(blank=True, null=True)

    def publish(self):
        self.publish_date = timezone.now()
        self.save()

    def approve_comments(self):
        return self.comments.filter(approve_comment=True)

    def get_absolute_url(self):
        return reverse('post_detail',kwargs={'pk':self.pk})


class Comment(models.Model):
    post = models.ForeignKey('blog.Post',related_name='comments')
    author = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(default=timezone.now())

    def approve_comments(self):
        return self.comments.filter(approve_comment=True)

    def get_absolute_url(self):
        return reverse('post_detail', kwargs={'pk': self.pk})