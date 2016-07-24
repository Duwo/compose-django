from django.test import TestCase
from django.core.urlresolvers import reverse

class PagesTest(TestCase):
  def test_404_500(self):
    response = self.client.get(reverse('portfolio:about') + "jsdkhaksj")
    self.assertEqual(200, response.status_code)