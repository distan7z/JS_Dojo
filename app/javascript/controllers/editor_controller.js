import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="editor"
export default class extends Controller {
  static targets = ["editor"]
  submit_code() {
    let unclean_code = this.editorTarget.innerText;
    let clean_code = "";

    /* removing code editor lines */
    for (var i = 0; i < unclean_code.length; i++) {
      if(isNaN(unclean_code.charAt(i))) {
        clean_code += unclean_code.charAt(i);
      }
    }

    console.log(clean_code)
  }
}
