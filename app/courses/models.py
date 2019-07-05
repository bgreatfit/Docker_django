from django.contrib.auth.models import User
from django.db import models
from pygments.lexers import get_lexer_by_name
from pygments.formatters.html import HtmlFormatter
from pygments import highlight


# Create your models here.
class Course(models.Model):
    title = models.CharField(max_length=255)
    url = models.URLField()
    owner = models.ForeignKey('auth.User', related_name='courses', on_delete=models.CASCADE, null=True, blank=True)
    highlighted = models.TextField()

    def __str__(self):
        return f'{self.title}'

    # def save(self, *args, **kwargs):
    #     """
    #     Use the `pygments` library to create a highlighted HTML
    #     representation of the code snippet.
    #     """
    #     lexer = get_lexer_by_name(self.language)
    #     linenos = 'table' if self.linenos else False
    #     options = {'title': self.title} if self.title else {}
    #     formatter = HtmlFormatter(style=self.style, linenos=linenos,
    #                               full=True, **options)
    #     self.highlighted = highlight(self.code, lexer, formatter)
    #     super(Course, self).save(*args, **kwargs)


class Review(models.Model):
    course = models.ForeignKey(Course, related_name='reviews', on_delete=models.SET_NULL, null=True)
    name = models.CharField(max_length=255)
    email = models.EmailField()
    comment = models.TextField(blank=True, default='')
    rating = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ['email', 'course']

    def __str__(self):
        return f'{self.rating} {self.email} for {self.course}'
