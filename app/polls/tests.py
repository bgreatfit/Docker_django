import datetime
from django.test import TestCase
from .models import Question
from django.utils import timezone
from django.urls import reverse
# Create your tests here.


class QuestionModelTests(TestCase):

    def test_was_published_recently_with_future_question(self):
        """
        was_published_recently() returns False for questions whose pub_date
        is in the future.
        """
        time = timezone.now() + datetime.timedelta(days=30)
        future_question = Question(pub_date=time)
        self.assertIs(future_question.was_published_recently(), False)


class QuestionIndexViewTest(TestCase):

    def test_question_with_no_response(self):
        response = self.client.get(reverse('polls:index'))
        self.assertEquals(response.status_code, 200);
        self.assertContains(response, 'No polls are available')
        self.assertQuerysetEqual(response.context['latest_question_list'], [])