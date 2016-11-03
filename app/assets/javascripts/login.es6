function readFileContent(file) {
  // Convert to ES6 Promise
  return new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.onload = () => {
      reader.error ? reject(reader.error) : resolve(reader.result)
    };
    // Read as base64
    reader.readAsDataURL(file);
  });
}

function POST(uri, data = {}) {
  const body = JSON.stringify(data); // serialize JSON to plain string
  const headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  return fetch(uri, { headers, body, method: 'POST' });
}

function onSubmit(event) {
  event.preventDefault();

  const form = event.target;
  const output = $('#output').first();
  const input = $('#file')[0];
  const email = $('#email')[0].value;

  if (!input.files || !input.files[0]) {
    return alert('No image selected');
  }

  const file = input.files[0];

  // TODO: should strip `data:image/png;base64,` ?
  return readFileContent(file)
    .then(image => POST('/rest/login', { email, image }))
    .then(result => result.json())
    .then(result => output.text(JSON.stringify(result, null, 4)))
    .catch(err => output.text(err));
}

function start() {
  // Add event listener
  $('#formulary').submit(onSubmit);
}

$(document).ready(start);
