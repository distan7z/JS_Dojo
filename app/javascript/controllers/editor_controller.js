import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="editor"
export default class extends Controller {
  static targets = ["editor"]
  submit_code(e) {
    e.preventDefault;
    console.log("oe");
    let editor_code = this.editorTarget.querySelector(".ace_content").innerText;
  }
}
