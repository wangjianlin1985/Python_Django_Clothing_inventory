import hashlib

from django.contrib import messages
from django.core.paginator import Paginator
from django.shortcuts import render, redirect, reverse

# Create your views here.
from common.models import User
from user.forms import UserForm


def list(request):
    # 返回一个 QuerySet 对象 ，包含所有的表记录
    qs = User.objects.values()
    paginator = Paginator(qs, 10)
    page = request.GET.get('page', '1')
    result = paginator.page(page)
    context = {
        'result': result,
    }
    return render(request, 'user/index.html', context)


def add(request):
    if request.method == "POST":
        user_form = UserForm(request.POST)
        if user_form.is_valid():
            username = user_form.cleaned_data['username']
            password = user_form.cleaned_data['password']
            name = user_form.cleaned_data['name']
            role = user_form.cleaned_data['role']

            new_user = User.objects.create(username=username,
                                           password=hash_code(password),
                                           name=name,
                                           role=role)
            context = {
                'id': new_user.id
            }
            messages.add_message(request, messages.SUCCESS, '添加成功')
            return redirect(reverse('user:index'))
        else:
            context = {
                'user_form': user_form
            }
            messages.add_message(request, messages.WARNING, '请检查填写的内容')
            return render(request, 'user/add.html', {'user_form': user_form})
    else:
        user_form = UserForm()
        context = {
            'user_form': user_form
        }
    return render(request, 'user/add.html', context)


def search(request):
    object = User.objects
    qs = object.values()
    id = request.POST.get('id')
    username = request.POST.get('username')
    name = request.POST.get('name')
    role = request.POST.get('role')
    if id:
        qs = object.filter(id=id)
    if username:
        qs = object.filter(username=username)
    if name:
        qs = object.filter(name=name)
    if role:
        qs = object.filter(role=role)
    paginator = Paginator(qs, 10)
    page = request.GET.get('page', '1')
    result = paginator.page(page)
    context = {
        'result': result
    }
    messages.add_message(request, messages.SUCCESS, '查询成功')
    return render(request, 'user/index.html', context)


def update(request, user_id):
    user = User.objects.get(id=user_id)

    if request.method == "POST":
        user_form = UserForm(request.POST)
        if user_form.is_valid():
            username = user_form.cleaned_data['username']
            password = user_form.cleaned_data['password']
            name = user_form.cleaned_data['name']
            role = user_form.cleaned_data['role']

            if username:
                user.username = username
            print(password==user.password)
            if password == user.password:
                user.password = password
            else:
                user.password = hash_code(password)
            if name:
                user.name = name
            if role:
                user.role = role

            user.save()
            context = {
                'user_id': user_id
            }
            messages.add_message(request, messages.SUCCESS, '修改成功')
            return redirect(reverse('user:index'))
        else:
            context = {
                'user_form': user_form
            }
            messages.add_message(request, messages.WARNING, '请检查填写的内容')
            return render(request, 'user/edit.html', context)
    else:
        user_form = UserForm({'id': user.id,
                              'username': user.username,
                              'password': user.password,
                              'name': user.name,
                              'role': user.role,
                              'create_time': user.create_time})
        context = {
            'user_form': user_form,
            'user_id': user_id
        }
    return render(request, 'user/edit.html', context)


def delete(request, user_id):
    user = User.objects.get(id=user_id)
    user.delete()
    messages.add_message(request, messages.SUCCESS, '删除成功')
    return redirect(reverse('user:index'))


def hash_code(s, salt='psf'):  # 加点盐
    h = hashlib.sha256()
    s += salt
    h.update(s.encode())  # update方法只接受bytes类型
    return h.hexdigest()
