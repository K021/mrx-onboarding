from django.shortcuts import render
from django.http import HttpResponse


def index(request):
    return HttpResponse("This is index page")


def detail(request, room_id):
    return HttpResponse(f"Specifications of the room #{room_id}.")


def results(request, room_id):
    response = f"furniture list in the room #{room_id}."
    return HttpResponse(response)


def vote(request, room_id):
    return HttpResponse(f"user list of the room #{room_id}.")
