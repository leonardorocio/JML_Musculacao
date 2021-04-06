from django.contrib import admin
from django.contrib.auth.models import Group
from backend.core.models import Article
from backend.core.models import Category
from django_summernote.admin import SummernoteModelAdmin

class ArticleAdmin(SummernoteModelAdmin):
    list_display = ('title', 'category')
    summernote_fields = ('text',)
    


admin.site.register(Article, ArticleAdmin)
admin.site.register(Category)
admin.site.unregister(Group)