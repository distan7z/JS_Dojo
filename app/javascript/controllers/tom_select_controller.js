import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";

export default class extends Controller {
  static values = { options: Object }
  connect() {
    const tomSelect = new TomSelect(this.element,
      this.optionsValue)
      // console.log(tomSelect);
  }
  test(e){
    // console.log(e)
  }
}
