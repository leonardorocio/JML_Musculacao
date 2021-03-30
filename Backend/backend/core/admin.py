from django.contrib import admin
from backend.core.models import Article
from django_summernote.admin import SummernoteModelAdmin

class ArticleAdmin(SummernoteModelAdmin):
    list_display = ('title', 'category')
    summernote_fields = ('text',)
    

admin.site.register(Article, ArticleAdmin)
