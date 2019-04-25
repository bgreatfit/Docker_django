from django.contrib import admin
from .models import Question,Choice, AccessRecords, WebPage, Topic, Users


class ChoiceInLine(admin.TabularInline):
    model = Choice
    extra = 3


class QuestionAdmin(admin.ModelAdmin):
   # fields = ['pub_date', 'question_text']
    fieldsets = [
        (None, {'fields': ['question_text']}),
        ('Date Information', {'fields': ['pub_date']}),
    ]
    list_display = ('question_text', 'pub_date', 'was_published_recently')
    inlines = [ChoiceInLine]
    list_filter = ['pub_date']
    search_fields = ['question_text']


# Register your models here.
admin.site.register(Question, QuestionAdmin)
admin.site.register(WebPage)
admin.site.register(AccessRecords)
admin.site.register(Topic)
admin.site.register(Users)
