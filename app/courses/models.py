from django.db import models


# Create your models here.
class Course(models.Model):
    title = models.CharField(max_length=255)
    url = models.URLField()

    def __str__(self):
        return f'{self.title}'


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
