import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  if (mapElement) {
  // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const center = JSON.parse(mapElement.dataset.center);
      let map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mcstr/ck9zdhznm37r51ipcypnv42hl'
      });

      // let map = new mapboxgl.Map({
      //   container: 'map',
      //   style: 'mapbox://styles/mcstr/ck9zdhznm37r51ipcypnv42hl',
      //   center: [center[1], center[0]],
      //   zoom: 10
      // });


    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      // // Create a HTML element for your custom marker
      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '25px';
      element.style.height = '25px';

      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(element)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(map);
    });

    // if (!center === 0) {
      fitMapToMarkers(map, markers);
    // }


    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                      mapboxgl: mapboxgl }));
  }
};

// infoWindow

// const addMarkersToMap = (map, markers) => {
//   markers.forEach((marker) => {
//     const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

//     new mapboxgl.Marker()
//       .setLngLat([ marker.lng, marker.lat ])
//       .setPopup(popup) // add this
//       .addTo(map);
//   });
// };

//get input value and put it in the map



export { initMapbox };

// Map with draggables
const draggableMap = () => {
const mapper = document.getElementById('mapper');
const coordinates = document.getElementById('coordinates');

mapboxgl.accessToken = mapper.dataset.mapboxApiKey;

//mapboxgl.accessToken = 'pk.eyJ1IjoibWNzdHIiLCJhIjoiY2s5eWN4Zjh3MDN1ZjNmczJ3MjFqeXNoeCJ9.K4cHfL9oaVplr2BfT4zjyQ';
const map = new mapboxgl.Map({
container: 'mapper',
style: 'mapbox://styles/mcstr/ck9zdhznm37r51ipcypnv42hl',
center: [-3.703551575565683, 40.41682800299995],
zoom: 5
});

const element = document.createElement('div')
console.log('helo;');
element.className = 'marker';
element.style.backgroundImage = `url('https://res.cloudinary.com/dhkoueugk/image/upload/v1589373288/Perretes/Paw_Print_y6ixeh.svg')`;
element.style.backgroundSize = '100% 100%';
element.style.width = '25px';
element.style.height = '25px';



const marker = new mapboxgl.Marker(element, {
draggable: true
})
.setLngLat([-3.703551575565683, 40.41682800299995])
.addTo(map);

function onDragEnd() {
const lngLat = marker.getLngLat();
coordinates.style.display = 'block';
coordinates.innerHTML =
'Longitude: ' + lngLat.lng + '<br />Latitude: ' + lngLat.lat;
}

marker.on('dragend', onDragEnd);


// Add geolocate control to the map.
map.addControl(
new mapboxgl.GeolocateControl({
positionOptions: {
enableHighAccuracy: true
},
trackUserLocation: true
})
);

};

export { draggableMap };
