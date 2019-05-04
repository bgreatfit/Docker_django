import os
from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.urls import reverse
from django.utils import timezone
from django.views import generic
from django.template import loader
from .models import Question,Choice, Topic,WebPage,AccessRecords
from . import forms, new_user_form


# Create your views here.

class IndexView(generic.ListView):
    context_object_name = 'latest_question_list'
    template_name = 'polls/index.html'

    def get_queryset(self):
        """Return the last five published questions."""
        now = timezone.now()
        return Question.objects.filter(pub_date__lte=now).order_by('-pub_date')[:5]


class DetailView(generic.DetailView):
    model = Question
    template_name = 'polls/detail.html'


class ResultView(generic.DetailView):
    model = Question
    template_name = 'polls/result.html'


def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    context = {'latest_question_list': latest_question_list}
    return render(request, 'polls/index.html', context)


# def index(request):
#     # try:
#
#     acces_recs = AccessRecords.objects.order_by('date')
#
#     context = {'acces_recs':acces_recs}
#     return render(request,'polls/index.html',context)
    #return render(request,'first_app.index.html')

def detail(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'polls/detail.html', {'question': question})


def vote(request, question_id):
    question = Question.objects.get(pk=question_id)
    try:
        selected_choice = question.choice_set.get(pk=request.POST['choice'])
    except (KeyError, Choice.DoesNotExist):
        # Redisplay the question voting form.
        return render(request, 'polls/detail.html', {
            'question': question,
            'error_message': "You didn't select a choice.",
        })
    else:
        selected_choice.votes += 1
        selected_choice.save()
        # Always return an HttpResponseRedirect after successfully dealing
        # with POST data. This prevents data from being posted twice if a
        # user hits the Back button.
        return HttpResponseRedirect(reverse('polls:result', args=(question.id,)))


def results(request, question_id):
    question = get_object_or_404(Question, pk=question_id)

    return render(request, 'polls/result.html', {'question': question})



# def polls(request, id):
#
#     # try:
#     question_test = {'test': ['hi', 'two', 'three']}
#     response = ",".join([question for question in question_test['test']])
#     #map();
#     # except
#
#
#
#    # data = np.random.randn(2, 3);
#     data = {'data':data}
#     latest_question_list = Question.objects.order_by('-pub_date')
#     context = {'latest_question_list': latest_question_list,'data':data}
#     # return latest_question_list
#     # output = ', '.join([q.question_text for q in latest_question_list])
#     return render(request,'polls/polls.html',context)
#     #return render(request,'first_app.index.html')
#

def view(request,id):
    try:
       question = Question.objects.get(pk=id)

    except Question.DoesNotExist:
        raise Http404("Question does not exist")
    return render(request,'polls/index.html', {'question': question})


def form_page(request):
    form = forms.Formname()
    # check to see if we get a post back
    if request.method == "POST":
        form = forms.Formname(request.POST)
        print('Here')
        if form.is_valid():
            print('Form Validation Prints in console')
            print(form.cleaned_data)
            print(form.cleaned_data['name'])
            print(form.cleaned_data['email'])
            print(form.cleaned_data['text'])
    return render(request, 'polls/form_page.html', {'form': form})


def new_user(request):
    userform = new_user_form.UserForm()
    if request.method == 'POST':
        userform = new_user_form.UserForm(request.POST)
        if userform.is_valid():
            userform.save(commit=True)
            return index(request)
    return render(request,'polls/registration.html', {'form': userform})



