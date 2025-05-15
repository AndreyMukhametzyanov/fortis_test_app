import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "table"]

  submit(event) {
    event.preventDefault()

    const query = this.inputTarget.value
    const url = `/chefs?query=${encodeURIComponent(query)}`

    fetch(url, {
      headers: {
        "Accept": "application/json"
      }
    })
      .then(res => res.json())
      .then(data => {
        this.updateTable(data.chefs)
      })
      .catch(error => console.error("Search error:", error))
  }

  updateTable(chefs) {
    this.tableTarget.innerHTML = chefs.map((chef, index) => `
      <tr>
        <td>${index + 1}</td>
        <td>${chef.name}</td>
        <td>${chef.bio}</td>
        <td class="text-center">
          <a href="/chefs/${chef.id}" class="btn btn-info btn-sm">Show</a>
          <a href="/chefs/${chef.id}/edit" class="btn btn-warning btn-sm">Edit</a>
          <a href="/chefs/${chef.id}" data-method="delete" data-confirm="Are you sure?" class="btn btn-danger btn-sm">Delete</a>
        </td>
      </tr>
    `).join("")
  }
}
