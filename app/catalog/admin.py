from django.contrib import admin
from .models import Book, BookInstance, Genre,Language,Author
# Register your models here.
# admin.site.register(Book)
# admin.site.register(BookInstance)
admin.site.register(Genre)
admin.site.register(Language)
# admin.site.register(Author)


class BookInstanceInline(admin.TabularInline):
    model = BookInstance


@admin.register(Book)
class BookAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'display_genre')
    inlines = [BookInstanceInline]


@admin.register(BookInstance)
class BookInstanceAdmin(admin.ModelAdmin):
    list_display = ['id', 'book', 'due_back', 'status']
    list_select_related = ('book',)
    list_filter = ('status', 'due_back')
    fieldsets = (
        (None, {'fields': ('book', 'imprint', 'id')}),
        ('Availability', {'fields': ('status', 'due_back')})
    )


@admin.register(Author)
class AuthorAdmin(admin.ModelAdmin):
    list_display = ('last_name', 'first_name', 'date_of_birth', 'date_of_death')
    list_filter = ['date_of_birth']
    search_fields = ['first_name']
    fields = [('last_name', 'first_name'),('date_of_birth', 'date_of_death')]



