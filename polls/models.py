from django.db import models


# Create your models here.

class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date time')

    def __str__(self):
        return self.question_text


class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)

    class Meta:
        db_table = 'choice'


class Topic(models.Model):
    top_name = models.CharField(max_length=255, unique=True)

    def _str_(self):
        return self.top_name

    class Meta:
        db_table = 'topic'


class WebPage(models.Model):
    topic = models.ForeignKey(Topic, on_delete=models.CASCADE)
    name = models.CharField(max_length=255, unique=True)
    url = models.URLField(unique=True)

    def _str_(self):
        return self.name

    class Meta:
        db_table = 'webpage'


class AccessRecords(models.Model):
    webpage = models.ForeignKey(WebPage, on_delete=models.CASCADE)
    date = models.DateField()

    def _str_(self):
        return str(self.date)

    class Meta:
        db_table = 'accessrecords'


class Users(models.Model):
    user_name = models.CharField(max_length=200)
    email_address = models.EmailField(max_length=255, unique=True)

    def _str_(self):
        return str(self.user_name)

    class Meta:
        db_table = 'new_users'

