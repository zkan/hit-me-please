from django.contrib import admin
from django.test import TestCase

from .admin import HitterAdmin
from .models import Hitter


class HitterTest(TestCase):
    def test_hitter_model_should_have_email_field(self):
        hitter = Hitter.objects.create(
            email='kan@prontomarketing.com'
        )
        self.assertEqual(hitter.email, 'kan@prontomarketing.com')


class HitterAdminTest(TestCase):
    def test_hitter_should_be_registed_to_admin(self):
        self.assertIsInstance(
            admin.site._registry[Hitter],
            HitterAdmin
        )



