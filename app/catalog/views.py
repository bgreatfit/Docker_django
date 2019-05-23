from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render,redirect
from django.views import generic
from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.decorators import login_required
from .forms import SignUpForm
# Create your views here.


from .models import Book, Author, BookInstance, Genre

@login_required
def index(request):
    request = request
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
        'request': request,
        #'num_book_genres':
    }

    # Render the HTML template index.html with the data in the context variable
    return render(request, 'catalog/index.html', context=context)


class BookListView(generic.ListView):
    model = Book
    template_name = 'catalog/book_list'
    paginate_by = 1

    # def get_queryset(self):
    #     return Book.objects.filter(title__icontains='war')[:5]  # Get 5 books containing the title war


class BookDetailView(generic.DetailView):
    model = Book
    template_name = 'catalog/book_detail.html'


class AuthorListView(generic.ListView):
    model = Author
    template_name = 'catalog/author_list'

    # def get_queryset(self):
    #     return Book.objects.filter(title__icontains='war')[:5]  # Get 5 books containing the title war


class AuthorDetailView(LoginRequiredMixin,generic.DetailView):
    model = Author
    template_name = 'catalog/author_detail.html'


def signup(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect('home')
    else:
        form = UserCreationForm()
    return render(request, 'catalog/signup.html', {'form': form})


class LoanedBooksByUserListView(LoginRequiredMixin, generic.ListView):
    template_name = 'catalog/bookinstance_list_borrowed_user.html'
    paginate_by = 10
    model = BookInstance

    def get_queryset(self):
        return  BookInstance.objects.filter(borrower=self.request.user).filter(status__exact='o').order_by('due_back')
