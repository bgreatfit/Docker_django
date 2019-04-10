from django.contrib import admin
from .models import Question,AccessRecords,WebPage,Topic, Users

class QuestionAdmin(admin.ModelAdmin):
    fields = ['pub_date', 'question_text']

# Register your models here.
admin.site.register(Question)
admin.site.register(WebPage)
admin.site.register(AccessRecords)
admin.site.register(Topic)
admin.site.register(Users)