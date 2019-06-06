import datetime

from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse, reverse_lazy
from django.views import generic
from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.decorators import login_required, permission_required
from django.views.generic.edit import  CreateView, DeleteView, UpdateView
from .forms import SignUpForm,RenewBookForm

# Create your views here.


from .models import Book, Author, BookInstance, Genre


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


class LoanedBooksByUserListView(LoginRequiredMixin,generic.ListView, PermissionRequiredMixin):
    template_name = 'catalog/bookinstance_list_borrowed_user.html'
    paginate_by = 10
    model = BookInstance
    # Or multiple permissions
    permission_required = ('catalog.can_mark_returned', 'catalog.can_edit')

    # Note that 'catalog.can_edit' is just an example
    # the catalog application doesn't have such permission!

    def get_queryset(self):
        return BookInstance.objects.filter(borrower=self.request.user).filter(status__exact='o').order_by('due_back')


class AllLoanedBooksListView(PermissionRequiredMixin, LoginRequiredMixin,generic.ListView):
    model = BookInstance
    template_name = 'catalog/bookinstance_list_borrowed_all.html'

    # Or multiple permissions
    permission_required = ('catalog.can_mark_returned', 'catalog.can_edit')

    # Note that 'catalog.can_edit' is just an example
    # the catalog application doesn't have such permission!

    def get_queryset(self):
        return BookInstance.objects.filter(status__exact='o').order_by('due_back')

@permission_required('catalog.can_mark_returned')
def renew_book_librarian(request, pk):
    book_instance = get_object_or_404(BookInstance, pk=pk)
    form = RenewBookForm()
    if request.method == 'POST':
        form = RenewBookForm(request.POST)
        if form.is_valid():
            book_instance.due_back = form.cleaned_data['renewal_date']
            book_instance.save()
            return HttpResponseRedirect(reverse('catalog:all-borrowed'))
        else:
            proposed_renewal_date = datetime.date.today() + datetime.timedelta(weeks=3)
            form = RenewBookForm(initial={'renewal_date': proposed_renewal_date})

    context = {'form': form,
               'book_instance': book_instance}
    return render(request,'catalog/book_renew_librarian.html',context=context)


class AuthorCreate(CreateView):
    model = Author
    fields = '__all__' \
             ''
    initial = {'date_of_death': '2017-06-5'}


class AuthorUpdate(UpdateView):
    model = Author
    fields = ['first_name', 'last_name', 'date_of_birth', 'death_of_death']


class AuthorDelete(DeleteView):
    model = Author
    success_url = reverse_lazy('catalog:authors')


