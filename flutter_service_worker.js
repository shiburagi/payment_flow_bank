'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "0914ccfc91d8a10ebe5278684fdf39ee",
"index.html": "976976759a19778bda35cf65bd1c7143",
"/": "976976759a19778bda35cf65bd1c7143",
"main.dart.js": "520ad01c7025088460df47d0253a7500",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "de9791f3f41d13ac9b8b414332dff7d1",
".git/config": "38881ccff4dc4e249623736f3cd97a15",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
"assets/AssetManifest.json": "8aa86c6ca0a70f821f9b62436730be8e",
"assets/NOTICES": "38cd2623c84527911f57f24894dec8d4",
"assets/FontManifest.json": "29a81fffc0efb28b73c66d135ee2b8dd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/Maven_Pro/MavenPro-Regular.ttf": "ac039aee4ec69579a64cdd63ed4db625",
"assets/fonts/Maven_Pro/MavenPro-Medium.ttf": "35091df93cc7a5c80c47fe071e8bd981",
"assets/fonts/Maven_Pro/MavenPro-Bold.ttf": "395274fac29fd63ac4ecdf9fa9d16d90",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/assets/svg/game.svg": "fa5b4be06ef72844b059d97f0ed5d59f",
"assets/assets/svg/wallet.svg": "f275becd3089d112ca54be074855a1b0",
"assets/assets/svg/bell.svg": "124c2ca8c41cb38ffcc23a26a6f8edf7",
"assets/assets/svg/wifi.svg": "186c0094ecd175e1bb3da7c1a2f6640f",
"assets/assets/svg/add.svg": "354f16ffcf12b871720fe7cc4409a1c5",
"assets/assets/svg/mastercard.svg": "029a52e7dfc56350627b557405c7c3be",
"assets/assets/svg/date.svg": "b6a0e601f52e4c545f30b9e70707fdb7",
"assets/assets/svg/transport.svg": "bd6c4cad31d04c4a9fcec134d72cef07",
"assets/assets/svg/menu.svg": "b20f23b66f4233d73c3469f30d6e836b",
"assets/assets/images/add.png": "caf52261dcdce1be5e3f54d0d5c14f25",
"assets/assets/images/wifi.png": "4a4668604580ff35102dc3f7b86b6193",
"assets/assets/images/bell.png": "1430b8ee06fc77a4602d70031f0d4f56",
"assets/assets/images/wallet.png": "22640e328afa3f75e682160fe4ccc92f",
"assets/assets/images/game.png": "ba59411f98a45a2098d33137e5fbaea2",
"assets/assets/images/menu.png": "ec1ab0a787fc4a11966214841b6acedd",
"assets/assets/images/date.png": "ea7ee0ac52bfd3c529d397acc9210207",
"assets/assets/images/transport.png": "23830ba96a7434cb67651638e7f33645",
"assets/assets/images/user1.jpg": "c6487531d73967f39b35e0cb9b533228",
"assets/assets/images/favourite5.jpg": "eef359d416365d32b655485700cf1b37",
"assets/assets/images/favourite4.jpg": "333ee44971ea6625c00ef7459ba8f764",
"assets/assets/images/favourite6.jpg": "bd95f711165e7fe917ed169aa5fd6594",
"assets/assets/images/mastercard.png": "922be987a34f70b590946a3163e2ba8a",
"assets/assets/images/favourite3.jpg": "293dd316e6396cab82f6be1adf6942eb",
"assets/assets/images/favourite2.jpg": "af122b520edd9c00e0d7f11e4d07eb48",
"assets/assets/images/favourite1.jpg": "114a3b09e62634fdc91b14c3147c5206"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
