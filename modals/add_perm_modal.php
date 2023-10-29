<div class="modal fade" id="addPermModal" tabindex="-1" role="dialog" aria-labelledby="addPermModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addPermModalLabel">Add Permission</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="permData">
        Add access permission to your documents.
        <div class="my-4">
          <div>
            <div class="radio-expiry-option">
              <input type="radio" name="duedate" id="noExpiry">
              <label for="expiry" class="m-0">No Due Date</label>
            </div>
            <div class="radio-expiry-option">
              <input type="radio" name="duedate" id="expiry" checked>
              <label for="expiry" class="m-0">Specific date and time</label>
            </div>
          </div>
          <input type="datetime-local" class="my-2" id="datetime">
          <div class="d-none text-danger" id="invalidDate">Invalid date</div>
        </div>
        <?php if (count($arr) !== 0): ?>
          <button class="btn btn-primary">Revoke Permission</button>
        <?php endif ?>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="addPermission">Add</button>
      </div>
    </div>
  </div>
</div>

<script>  
const expiryOptions = $(".radio-expiry-option");

for (const className of "d-flex align-items-center".split(" ")) {
  expiryOptions.addClass(className);
  expiryOptions.attr("style", "gap: 6px")
}

const radioOptions = [];

const dt = $("#datetime");

document.querySelectorAll("input[name=duedate]").forEach(item => {
  radioOptions.push(item);
  item.onchange = e => {
    const id = e.target.id;
    dt.toggleClass("d-none", id !== 'expiry');

    if (id === 'noExpiry') {
      inv.toggleClass("d-none", true);
    }
  }
});

const inv = $("#invalidDate");
let isValid = false;

let due;

dt.change(e => {
  const now = new Date();
  due = new Date(e.originalEvent.target.value);
  const isInvalid = now > due;
  inv.toggleClass("d-none", !isInvalid);
  isValid = !isInvalid;
});

const btnAdd = $("#addPermission");

btnAdd.attr("disabled", <?php echo !count($arr) ? "false" : "true" ?>);

btnAdd.click(() => {
  const radioId = radioOptions.find(x => x.checked).id;

  if (!isValid && radioId === 'expiry') {
    inv.toggleClass("d-none", false);
    return;
  }

  const id = (new URL(document.location)).searchParams.get("id");

  const data = new FormData();

  data.set("documentId", id);
  data.set("dueDate", due ? dayjs(due).format("YYYY-MM-DD HH:mm:ss") : null);

  fetch("/ajax.php?action=add_permission", { method: "POST", body: data }).then(async resp => {
    const e=await resp.text();
    if (e === '1'){
      alert_toast("Permission added");
      $("#addPermModal").modal("hide");
    }
  });
});

</script>