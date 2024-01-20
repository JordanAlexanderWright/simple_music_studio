import { Controller } from "@hotwired/stimulus"
// import { StudioInvitaitonsMailer } from "mailers/studio_invitations_mailer_test.rb"

export default class extends Controller {
    static targets = [ "modal", "email" ]
    static values = { studioId: Number}
    // connect() {
    //     this.element.textContent = "Hello World!"
    // }

    open() {
        this.modalTarget.showModal();
        document.body.classList.add('overflow-hidden');
    }

    // Come back to this later, not working.
    clickOutside(e) {
        // console.log('hello');
        // console.log(e.target);
        if (e.target === this.modalTarget) {
            this.modalTarget.close();
        }
    }

    closeModal() {
        this.modalTarget.close();
    }

    submit() {
        const email = this.emailTarget.value;
        const studio = this.studioIdValue;

        async function sendEmail(url = 'http://localhost:3000/send_invitation', data = { email, studio }) {
            try {
                const response = await fetch(url, {
                    method: "POST",
                    credentials: "same-origin",
                    headers: {
                        "Content-Type": "application/json",
                        "X-CSRF-Token": document.querySelector('[name="csrf-token"]').content
                    },
                    body: JSON.stringify(data)
                });
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                const responseData = await response.json();
                console.log(responseData);
            } catch (error) {
                console.error('There has been a problem with your fetch operation:', error);
            }
        }

        sendEmail();

        console.log('Submitting form');
    }

}
