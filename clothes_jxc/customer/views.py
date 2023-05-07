from django.contrib import messages
from django.core.paginator import Paginator
from django.shortcuts import render, redirect

# Create your views here.
from django.urls import reverse

from common.models import Customer
from customer.forms import CustomerForm


def list(request):
    # 返回一个 QuerySet 对象 ，包含所有的表记录
    qs = Customer.objects.all()
    paginator = Paginator(qs, 10)
    page = request.GET.get('page', '1')
    result = paginator.page(page)
    context = {
        'result': result
    }
    return render(request, 'customer/index.html', context)


def add(request):
    if request.method == "POST":
        customer_form = CustomerForm(request.POST)
        if customer_form.is_valid():
            name = customer_form.cleaned_data['name']
            phone = customer_form.cleaned_data['phone']
            address = customer_form.cleaned_data['address']

            new_customer = Customer.objects.create(name=name,
                                                   phone=phone,
                                                   address=address)
            context = {
                'id': new_customer.id
            }
            messages.add_message(request, messages.WARNING, '添加成功')
            return redirect(reverse('customer:index'))

        else:
            context = {
                'customer_form': customer_form
            }
            messages.add_message(request, messages.WARNING, '请检查填写的内容')
            return render(request, 'customer/add.html', context)
    else:
        customer_form = CustomerForm()
        context = {
            'customer_form': customer_form
        }
        return render(request, 'customer/add.html', context)


def search(request):
    object = Customer.objects
    qs = object.values()
    id = request.POST.get('id')
    name = request.POST.get('name')
    phone = request.POST.get('phone')
    address = request.POST.get('address')
    if id:
        qs = object.filter(id=id)
    if name:
        qs = object.filter(name=name)
    if phone:
        qs = object.filter(phone=phone)
    if address:
        qs = object.filter(address__contains=address)
    paginator = Paginator(qs, 10)
    page = request.GET.get('page', '1')
    result = paginator.page(page)
    context = {
        'result': result
    }
    messages.add_message(request, messages.SUCCESS, '查询成功')
    return render(request, 'customer/index.html', context)


def update(request, customer_id):
    customer = Customer.objects.get(id=customer_id)

    if request.method == "POST":
        customer_form = CustomerForm(request.POST)
        if customer_form.is_valid():
            name = customer_form.cleaned_data['name']
            phone = customer_form.cleaned_data['phone']
            address = customer_form.cleaned_data['address']

            if name:
                customer.name = name
            if phone:
                customer.phone = phone
            if address:
                customer.address = address

            customer.save()
            context = {
                'customer_id': customer_id
            }
            messages.add_message(request, messages.SUCCESS, '修改成功')
            return redirect(reverse('customer:index'))
        else:
            context = {
                'customer_form': customer_form
            }
            messages.add_message(request, messages.WARNING, '请检查填写的内容')
            return render(request, 'customer/edit.html', context)
    else:
        customer_form = CustomerForm({'id': customer.id,
                                      'name': customer.name,
                                      'phone': customer.phone,
                                      'address': customer.address,
                                      'create_time': customer.create_time})
        context = {
            'customer_form': customer_form,
            'customer_id': customer_id
        }
        return render(request, 'customer/edit.html', context)


def delete(request, customer_id):
    customer = Customer.objects.get(id=customer_id)
    customer.delete()
    messages.add_message(request, messages.SUCCESS, '删除成功')
    return redirect(reverse('customer:index'))
