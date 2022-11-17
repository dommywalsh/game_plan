import { Controller } from "@hotwired/stimulus";
import Swal from "sweetalert2";

// Connects to data-controller="alert"
export default class extends Controller {
  static values = {
    name: String,
    bio: String,
    image: String,
  };

  connect() {
    console.log("hello");
    // console.log("user", this.userValue.a);
  }

  fireAlert(event) {
    event.preventDefault();
    // console.log({
    //   userName: this.nameValue,
    //   userBio: this.bioValue,
    //   userImageUrl: this.imageValue,
    // });

    Swal.fire({
      title: this.nameValue,
      text: this.bioValue,
      imageUrl: this.imageValue,
      imageWidth: 100,
      imageHeight: 100,
      imageAlt: "Profile avatar",
    });
  }
}
