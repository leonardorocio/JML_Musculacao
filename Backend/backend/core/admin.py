from django.contrib import admin
from django.contrib.auth.models import Group
from backend.core.models import Article, Exercicio, Treino, Category, Comentario
from django_summernote.admin import SummernoteModelAdmin


class ArticleAdmin(SummernoteModelAdmin):
    list_display = ('title', 'category')
    summernote_fields = ('text',)


class ComentarioAdmin(admin.ModelAdmin):
    list_display = ('titulo_comentario', 'autor_comentario',
                    'artigo_comentario', 'data_comentario', 
                    'publicado_comentario', 
                    )
    list_editable = ('publicado_comentario',)
    list_per_page = 20

admin.site.register(Article, ArticleAdmin)
admin.site.register(Category)
admin.site.register(Exercicio)
admin.site.register(Treino)
admin.site.register(Comentario, ComentarioAdmin)
admin.site.unregister(Group)
