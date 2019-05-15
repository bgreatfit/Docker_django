from django.shortcuts import render
from django.views import generic
# Create your views here.


from .models import Book, Author, BookInstance, Genre


def index(request):
    """View function for home page of site."""

    # Generate counts of some of the main objects
    num_books = Book.objects.all().count()
    num_instances = BookInstance.objects.all().count()
    # num_books_genre = Book.objects.filter(genre__name__contains='Fiction')
    # print(num_books_genre)
    # Available books (status = 'a')
    num_instances_available = BookInstance.objects.filter(status__exact='a').count()

    # The 'all()' is implied by default.
    num_authors = Author.objects.count()
    #num_authors = Book.objects.
    context = {
        'num_books': num_books,
        'num_instances': num_instances,
        'num_instances_available': num_instances_available,
        'num_authors': num_authors,
        #'num_book_genres':
    }

    # Render the HTML template index.html with the data in the context variable
    return render(request, 'catalog/index.html', context=context)


class BookView(generic.ListView):
    model = Book

    # def get_queryset(self):
    #     return Book.objects.filter(title__icontains='war')[:5]  # Get 5 books containing the title war