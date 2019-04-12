from django.contrib import admin
from .models import Question, AccessRecords, WebPage, Topic, Users


class QuestionAdmin(admin.ModelAdmin):
   # fields = ['pub_date', 'question_text']
    fieldsets = [
        (None, {'fields': ['question_text']}),
        ('Date Information', {'fields': ['pub_date']}),
    ]


# Register your models here.
admin.site.register(Question, QuestionAdmin)
admin.site.register(WebPage)
admin.site.register(AccessRecords)
admin.site.register(Topic)
admin.site.register(Users)
