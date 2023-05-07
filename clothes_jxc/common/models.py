from django.db import models


# Create your models here.
class User(models.Model):
    role_choices = (
        ('操作员', '操作员'),
        ('管理员', '管理员')
    )
    # 用户名
    username = models.CharField(max_length=32, unique=True, verbose_name='用户名')
    # 密码
    password = models.CharField(max_length=100, verbose_name='密码')
    # 姓名
    name = models.CharField(max_length=32, verbose_name='姓名')
    # 角色
    role = models.CharField(max_length=32, choices=role_choices, default='操作员', verbose_name='角色')
    # 创建时间
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    # 修改时间
    modify_time = models.DateTimeField(auto_now=True, verbose_name='修改时间')

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['create_time']
        verbose_name = '用户'
        verbose_name_plural = verbose_name


class Customer(models.Model):
    # 客户名
    name = models.CharField(max_length=32, verbose_name='客户名')
    # 电话
    phone = models.CharField(max_length=32, verbose_name='电话')
    # 地址
    address = models.CharField(max_length=32, verbose_name='地址')
    # 创建时间
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    # 修改时间
    modify_time = models.DateTimeField(auto_now=True, verbose_name='修改时间')

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['create_time']
        verbose_name = '客户'
        verbose_name_plural = verbose_name


class Clothes(models.Model):
    size_choices = (
        ('S', 'S'),
        ('M', 'M'),
        ('L', 'L'),
        ('XL', 'XL'),
        ('XXL', 'XXL')
    )
    # 服装名称
    name = models.CharField(max_length=32, verbose_name='服装名')
    # 服装号
    sn = models.CharField(max_length=32, unique=True, verbose_name='服装号')
    # 价格
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='价格')
    # 尺寸
    size = models.CharField(max_length=32, choices=size_choices, verbose_name='尺寸')
    # 颜色
    color = models.CharField(max_length=32, verbose_name='颜色')
    # 库存
    stock = models.PositiveIntegerField(verbose_name='库存')
    # 图片
    image = models.ImageField(upload_to='clothes', verbose_name='图片')
    # 描述
    desc = models.CharField(max_length=200, verbose_name='描述')
    # 创建时间
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    # 修改时间
    modify_time = models.DateTimeField(auto_now=True, verbose_name='修改时间')

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['create_time']
        verbose_name = '服装'
        verbose_name_plural = verbose_name


class Inorder(models.Model):
    # 入库单号
    code = models.CharField(max_length=32, verbose_name='入库单号')
    # 客户
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, verbose_name='客户')
    # 用户
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='用户')
    # 入库单里的服装，和Clothes表是多对多的关系
    clothes = models.ManyToManyField(Clothes, through='InorderClothes', verbose_name='服装')
    # 创建时间
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    # 修改时间
    modify_time = models.DateTimeField(auto_now=True, verbose_name='修改时间')

    def __str__(self):
        return self.code

    class Meta:
        ordering = ['create_time']
        verbose_name = '入库单'
        verbose_name_plural = verbose_name


class InorderClothes(models.Model):
    # 入库单
    inorder = models.ForeignKey(Inorder, on_delete=models.CASCADE, verbose_name='入库单')
    # 服装
    clothes = models.ForeignKey(Clothes, on_delete=models.CASCADE, verbose_name='服装')
    # 入库单中服装的数量
    amount = models.PositiveIntegerField()

    def __str__(self):
        return self.clothes.name

    class Meta:
        ordering = ['id']
        verbose_name = '入库单详情'
        verbose_name_plural = verbose_name


class Outorder(models.Model):
    # 出库单号
    code = models.CharField(max_length=32, verbose_name='出库单号')
    # 客户
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, verbose_name='客户')
    # 用户
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='用户')
    # 入库单里的服装，和Clothes表是多对多的关系
    clothes = models.ManyToManyField(Clothes, through='OutorderClothes', verbose_name='服装')
    # 创建时间
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    # 修改时间
    modify_time = models.DateTimeField(auto_now=True, verbose_name='修改时间')

    def __str__(self):
        return self.code

    class Meta:
        ordering = ['create_time']
        verbose_name = '出库单'
        verbose_name_plural = verbose_name


class OutorderClothes(models.Model):
    # 出库单
    outorder = models.ForeignKey(Outorder, on_delete=models.CASCADE, verbose_name='出库单')
    # 服装
    clothes = models.ForeignKey(Clothes, on_delete=models.CASCADE, verbose_name='服装')
    # 出库单中服装的数量
    amount = models.PositiveIntegerField(verbose_name='数量')

    def __str__(self):
        return self.clothes.name

    class Meta:
        ordering = ['id']
        verbose_name = '出库单详情'
        verbose_name_plural = verbose_name
