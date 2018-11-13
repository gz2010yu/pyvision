from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from sae.basic.models import User, LoginRecord, Image, InternalMessage, UnreadGroupMessage

admin.site.register(User, UserAdmin)
admin.site.register(LoginRecord)
admin.site.register(Image)
admin.site.register(InternalMessage)
admin.site.register(UnreadGroupMessage)
