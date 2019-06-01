from django.http import HttpResponse
from django.views import View


class LandingPageView(View):
    def get(self, request):
        html = '<form action="." method="post">'
        html += '<input type="email" name="email">'
        html += '<button type="submit">Submit</button>'
        html += '</form>'
        return HttpResponse(html)

