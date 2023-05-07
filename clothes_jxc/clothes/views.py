from django.contrib import messages
from django.core.paginator import Paginator
from django.http import JsonResponse
from django.shortcuts import render, redirect
# Create your views here.
from django.urls import reverse

from clothes.forms import ClothesForm
from common.models import Clothes


def list(request):
    # 返回一个 QuerySet 对象 ，包含所有的表记录
    qs = Clothes.objects.all()
    short = []
    for foo in qs:
        if foo.stock < 10:
            short.append(foo.name)
    short_str = '、'.join(short)
    messages.add_message(request, messages.WARNING, f'{str(short_str)}库存不足')
    paginator = Paginator(qs, 10)
    page = request.GET.get('page', '1')
    result = paginator.page(page)
    context = {
        'result': result,
    }
    return render(request, 'clothes/index.html', context)


def add(request):
    if request.method == "POST":
        clothes_form = ClothesForm(request.POST)
        if clothes_form.is_valid():
            name = clothes_form.cleaned_data['name']
            sn = clothes_form.cleaned_data['sn']
            price = clothes_form.cleaned_data['price']
            size = clothes_form.cleaned_data['size']
            color = clothes_form.cleaned_data['color']
            stock = clothes_form.cleaned_data['stock']
            desc = clothes_form.cleaned_data['desc']

            new_clothes = Clothes.objects.create(name=name,
                                                 sn=sn,
                                                 price=price,
                                                 size=size,
                                                 color=color,
                                                 stock=stock,
                                                 desc=desc)
            context = {
                'id': new_clothes.id,
            }
            messages.add_message(request, messages.SUCCESS, '添加成功')
            return redirect('/clothes/')

        else:
            context = {
                'clothes_form': clothes_form
            }
            messages.add_message(request, messages.WARNING, '请检查填写的内容')
            return render(request, 'clothes/add.html', context)
    else:
        clothes_form = ClothesForm()
        context = {
            'clothes_form': clothes_form
        }
        return render(request, 'clothes/add.html', context)


def search(request):
    object = Clothes.objects
    qs = object.values()
    id = request.POST.get('id')
    name = request.POST.get('name')
    sn = request.POST.get('sn')
    min = request.POST.get('min')
    max = request.POST.get('max')
    size = request.POST.get('size')
    color = request.POST.get('color')
    if id:
        qs = object.filter(id=id)
    if name:
        qs = object.filter(name=name)
    if sn:
        qs = object.filter(sn=sn)
    if min:
        qs = object.filter(price__gte=min)
    if max:
        qs = object.filter(price__lte=max)
    if size:
        qs = object.filter(size=size)
    if color:
        qs = object.filter(color=color)
    paginator = Paginator(qs, 10)
    page = request.GET.get('page', '1')
    result = paginator.page(page)
    context = {
        'result': result
    }
    messages.add_message(request, messages.SUCCESS, '查询成功')
    return render(request, 'clothes/index.html', context)


def update(request, clothes_id):
    clothes = Clothes.objects.get(id=clothes_id)

    if request.method == "POST":
        clothes_form = ClothesForm(request.POST)
        if clothes_form.is_valid():
            name = clothes_form.cleaned_data['name']
            sn = clothes_form.cleaned_data['sn']
            price = clothes_form.cleaned_data['price']
            size = clothes_form.cleaned_data['size']
            color = clothes_form.cleaned_data['color']
            stock = clothes_form.cleaned_data['stock']
            desc = clothes_form.cleaned_data['desc']

            if name:
                clothes.name = name
            if sn:
                clothes.sn = sn
            if price:
                clothes.price = price
            if size:
                clothes.size = size
            if color:
                clothes.color = color
            if stock:
                clothes.stock = stock
            if desc:
                clothes.desc = desc

            clothes.save()

            context = {
                'clothes_id': clothes_id
            }
            messages.add_message(request, messages.SUCCESS, '修改成功')
            return redirect(reverse('clothes:index'))
        else:
            context = {
                'clothes_form': clothes_form
            }
            messages.add_message(request, messages.WARNING, '请检查填写的内容')
            return render(request, 'clothes/edit.html', context)
    else:
        clothes_form = ClothesForm({'id': clothes.id,
                                    'name': clothes.name,
                                    'sn': clothes.sn,
                                    'price': clothes.price,
                                    'size': clothes.size,
                                    'color': clothes.color,
                                    'stock': clothes.stock,
                                    'desc': clothes.desc})
        context = {
            'clothes_form': clothes_form,
            'clothes_id': clothes_id
        }
        return render(request, 'clothes/edit.html', context)


def delete(request, clothes_id):
    clothes = Clothes.objects.get(id=clothes_id)
    clothes.delete()
    messages.add_message(request, messages.SUCCESS, '删除成功')
    return redirect(reverse('clothes:index'))


def checkstock(request, clothes_id):
    clothes = Clothes.objects.get(id=clothes_id)
    return JsonResponse({'stock': clothes.stock})
