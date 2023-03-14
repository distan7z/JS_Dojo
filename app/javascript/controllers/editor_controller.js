import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="editor"
export default class extends Controller {
  static targets = ["editor", "input", "form"]
  submitCode(e) {
    e.preventDefault();
    console.log("oe");
    let editor_code = this.editorTarget.querySelector(".ace_content").innerText;
    console.log(`editor_code: ${editor_code}`);
    console.log(`this.inputTarget.value: ${this.inputTarget.value}`);
    this.inputTarget.value = editor_code
    this.formTarget.requestSubmit();
  }
}
