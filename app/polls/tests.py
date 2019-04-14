import datetime
from django.utils import timezone
from django.urls import reverse
from django.test import TestCase
import pytest
from .models import Question

# Create your tests here.


class TestSimpleApp:
    def test_one(self):
        x = "my simple app test"
        assert 'simple app' in x