/**
 * github-api.js — thin wrapper around the GitHub Contents API.
 * Reads/writes JSON data files in the repo without a backend.
 *
 * Requires a Fine-grained PAT with Contents: Read & Write stored in
 * localStorage under the key "gh_token".
 */

var GH = (function () {
  var OWNER = 'sarvsop-crypto';
  var REPO  = 'ngo';
  var BRANCH = 'main';
  var BASE  = 'https://api.github.com/repos/' + OWNER + '/' + REPO + '/contents/';

  function token() {
    return localStorage.getItem('gh_token') || '';
  }

  function headers() {
    return {
      'Authorization': 'Bearer ' + token(),
      'Accept': 'application/vnd.github+json',
      'X-GitHub-Api-Version': '2022-11-28',
      'Content-Type': 'application/json'
    };
  }

  /** Read a file. Returns { content (parsed JSON), sha } */
  function readFile(path) {
    return fetch(BASE + path + '?ref=' + BRANCH, { headers: headers() })
      .then(function (r) {
        if (!r.ok) throw new Error('GitHub API ' + r.status);
        return r.json();
      })
      .then(function (data) {
        var json = JSON.parse(atob(data.content.replace(/\n/g, '')));
        return { content: json, sha: data.sha };
      });
  }

  /** Write (create or update) a file. Pass current sha to update. */
  function writeFile(path, json, sha, message) {
    var body = {
      message: message || 'chore: update ' + path,
      content: btoa(unescape(encodeURIComponent(JSON.stringify(json, null, 2)))),
      branch: BRANCH
    };
    if (sha) body.sha = sha;

    return fetch(BASE + path, {
      method: 'PUT',
      headers: headers(),
      body: JSON.stringify(body)
    }).then(function (r) {
      if (!r.ok) return r.json().then(function (e) { throw new Error(e.message || r.status); });
      return r.json();
    });
  }

  /** Convenience: read data/X.json, prepend item, write back */
  function prependItem(dataFile, item, commitMsg) {
    return readFile('data/' + dataFile + '.json')
      .then(function (res) {
        // remove existing item with same id if present (update case)
        var arr = res.content.filter(function (x) { return x.id !== item.id; });
        arr.unshift(item);
        return writeFile('data/' + dataFile + '.json', arr, res.sha, commitMsg);
      });
  }

  /** Remove item by id */
  function removeItem(dataFile, id, commitMsg) {
    return readFile('data/' + dataFile + '.json')
      .then(function (res) {
        var arr = res.content.filter(function (x) { return x.id !== id; });
        return writeFile('data/' + dataFile + '.json', arr, res.sha, commitMsg || 'chore: remove ' + id);
      });
  }

  /** Verify that the stored token works */
  function verifyToken() {
    return fetch('https://api.github.com/repos/' + OWNER + '/' + REPO, { headers: headers() })
      .then(function (r) { return r.ok; })
      .catch(function () { return false; });
  }

  return { readFile: readFile, writeFile: writeFile, prependItem: prependItem, removeItem: removeItem, verifyToken: verifyToken };
})();
