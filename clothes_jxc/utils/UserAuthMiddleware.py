from django.http import HttpResponseRedirect
from django.utils.deprecation import MiddlewareMixin
from common.models import User
#只有在登录的情况下才能访问
class AuthMiddleware(MiddlewareMixin):

    def process_request(self, request):
        # 统一验证登录
        # return None 或者不写
        if request.path == '/login/' or request.path == '/register/' or request.path == '/index/' \
                or request.path == '/captchaimage/':
            return None
        user_id = request.COOKIES.get('user_id')
        if not user_id:
            return HttpResponseRedirect('/login/')
        user = User.objects.filter(id=user_id)
        if not user:
            return HttpResponseRedirect('/login/')