
from django.test import TestCase

from catalog.models import Author


class AuthorModelTestClass(TestCase):
    @classmethod
    def setUpTestData(cls):
        # setup non modified object used by all methods
        Author.objects.create(first_name='Big', last_name='Bob')

    def test_first_name_label (self):
        author = Author.objects.get(id=1)
        field_name = author._meta.get_field('first_name').verbose_name
        self.assertEquals(field_name, 'first name')

