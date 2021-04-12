from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('<int:room_id>/', views.detail, name='detail'),
    path('<int:room_id>/furnitures/', views.results, name='results'),
    path('<int:room_id>/users/', views.vote, name='vote'),
]