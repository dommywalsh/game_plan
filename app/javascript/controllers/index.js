// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AlertController from "./alert_controller"
application.register("alert", AlertController)

import CounterController from "./counter_controller"
application.register("counter", CounterController)

import EventSubscriptionController from "./event_subscription_controller"
application.register("event-subscription", EventSubscriptionController)

import FlatpickerController from "./flatpicker_controller"
application.register("flatpicker", FlatpickerController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import LettersController from "./letters_controller"
application.register("letters", LettersController)

import MapController from "./map_controller"
application.register("map", MapController)
