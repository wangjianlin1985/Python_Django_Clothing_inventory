import hashlib

from django.contrib import messages
from django.http import JsonResponse
from django.shortcuts import render, redirect
# Create your views here.
from django.urls import reverse

from common import models
from common.forms import LoginForm, RegisterForm, ChangepwdForm
from common.models import User


def index(request):
    pass
    return render(request, 'index.html')


def login(request):
    if request.session.get('is_login', None):
        return redirect(reverse('index'))

    if request.method == "POST":
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            username = login_form.cleaned_data['username']
            password = login_form.cleaned_data['password']
            try:
                user = models.User.objects.get(username=username)
                if user.password == hash_code(password):  # 哈希值和数据库内的值进行比对
                    request.session['is_login'] = True
                    request.session['user_id'] = user.id
                    request.session['user_name'] = user.name
                    request.session['user_role'] = user.role
                    return redirect(reverse('index'))
                else:
                    messages.add_message(request, messages.WARNING, '密码不正确')
            except User.DoesNotExist:
                messages.add_message(request, messages.WARNING, '用户不存在')
        return render(request, 'login.html', locals())
    login_form = LoginForm()
    return render(request, 'login.html', locals())


def register(request):
    if request.session.get('is_login', None):
        return redirect(reverse('index'))
    if request.method == "POST":
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():  # 获取数据
            username = register_form.cleaned_data['username']
            password1 = register_form.cleaned_data['password1']
            password2 = register_form.cleaned_data['password2']
            name = register_form.cleaned_data['name']
            if password1 != password2:  # 判断两次密码是否相同
                messages.add_message(request, messages.WARNING, '两次输入的密码不同')
                return render(request, 'register.html', locals())
            else:
                same_name_user = models.User.objects.filter(username=username)
                if same_name_user:  # 用户名唯一
                    messages.add_message(request, messages.WARNING, '用户已存在，请重新选择用户名')
                    return render(request, 'register.html', locals())

                # 当一切都OK的情况下，创建新用户
                new_user = models.User.objects.create(username=username,
                                                      password=hash_code(password1),
                                                      name=name)
                new_user.save()
                return redirect(reverse('index'))  # 自动跳转到登录界面
    register_form = RegisterForm()
    return render(request, 'register.html', locals())


def logout(request):
    if not request.session.get('is_login', None):
        # 如果本来就未登录，也就没有注销一说
        return redirect(reverse(reverse('index')))
    request.session.flush()
    return redirect(reverse('index'))


def changepwd(request):
    if not request.session.get('is_login', None):
        return redirect(reverse('index'))
    user = User.objects.get(id=request.session['user_id'])

    if request.method == "POST":
        changepwd_form = ChangepwdForm(request.POST)
        if changepwd_form.is_valid():
            password_now = changepwd_form.cleaned_data['password_now']
            print(hash_code(password_now))
            password1 = changepwd_form.cleaned_data['password1']
            print(password1)
            password2 = changepwd_form.cleaned_data['password2']
            print(password2)

            if hash_code(password_now) == user.password:
                if password1 == password2:
                    user.password = hash_code(password1)
                    user.save()
                    messages.add_message(request, messages.SUCCESS, '修改成功')
                    return redirect(reverse('index'))
                else:
                    context = {
                        'changepwd_form': changepwd_form
                    }
                    messages.add_message(request, messages.WARNING, '两次输入的密码不一致')
                    return render(request, 'changepwd.html', context)
            else:
                context = {
                    'changepwd_form': changepwd_form
                }
                messages.add_message(request, messages.WARNING, '原密码不正确')
                return render(request, 'changepwd.html', context)
        else:
            context = {
                'changepwd_form': changepwd_form
            }
            messages.add_message(request, messages.WARNING, '请检查填写的内容')
            return render(request, 'changepwd.html', context)
    else:
        changepwd_form = ChangepwdForm()
        context = {
            'changepwd_form': changepwd_form,
        }
        return render(request, 'changepwd.html', context)


def checkusername(request, username):
    same_name_user = User.objects.filter(username=username)
    if not same_name_user:
        return JsonResponse({'ret': 0, 'msg': '用户名可使用'})
    return JsonResponse({'ret': 1, 'msg': '用户名已存在'})


def hash_code(s, salt='psf'):  # 加点盐
    h = hashlib.sha256()
    s += salt
    h.update(s.encode())  # update方法只接受bytes类型
    return h.hexdigest()
