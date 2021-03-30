from django.apps import AppConfig
from django.utils.translation import ugettext_lazy as _


class CoreConfig(AppConfig):
    name = 'backend.core'
    verbose_name = _('core')

    def ready(self):
        import backend.core.signals

