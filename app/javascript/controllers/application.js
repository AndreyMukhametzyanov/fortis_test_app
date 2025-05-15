import { Application } from "@hotwired/stimulus"
import "bootstrap"
import * as bootstrap from "bootstrap"
import { createPopper } from "@popperjs/core";
const application = Application.start()

application.debug = false
window.Stimulus   = application
import Rails from "@rails/ujs"
Rails.start()
export { application }
