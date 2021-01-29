import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  if (mapElement) {
    // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const center = JSON.parse(mapElement.dataset.center);
    let map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v11',
    });

    var layerList = document.getElementById('menu');
    var inputs = layerList.getElementsByTagName('input');

    function switchLayer(layer) {
      var layerId = layer.target.id;
      map.setStyle('mapbox://styles/mapbox/' + layerId);
    }

    for (var i = 0; i < inputs.length; i++) {
      inputs[i].onclick = switchLayer;
    }

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

    // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
    //                                   mapboxgl: mapboxgl }));
    //add zoomcontrol
    map.addControl(new mapboxgl.NavigationControl());
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
  if (mapper != null) {
    mapboxgl.accessToken = mapper.dataset.mapboxApiKey;

    // const map = new mapboxgl.Map({
    //   container: 'mapper',
    //   style: 'mapbox://styles/mapbox/streets-v11',
    //   center: [-3.703551575565683, 40.41682800299995],
    //   zoom: 11,
    // });

    var layerList = document.getElementById('menu');
    var inputs = layerList.getElementsByTagName('input');

    function switchLayer(layer) {
      var layerId = layer.target.id;
      map.setStyle('mapbox://styles/mapbox/' + layerId);
    }

    for (var i = 0; i < inputs.length; i++) {
      inputs[i].onclick = switchLayer;
    }

    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('https://res.cloudinary.com/dhkoueugk/image/upload/v1589373288/Perretes/Paw_Print_y6ixeh.svg')`;
    element.style.backgroundSize = '100% 100%';
    element.style.width = '25px';
    element.style.height = '25px';

    navigator.geolocation.getCurrentPosition(success);
    // function to locate the device
    function success(pos) {
      const crd = pos.coords;
    }

    const marker = new mapboxgl.Marker(element, {
      draggable: true,
    })
      .setLngLat([-3.703551575565683, 40.41682800299995])
      .addTo(map);

    function onDragEnd() {
      const lngLat = marker.getLngLat();
      coordinates.style.display = 'block';
      coordinates.innerHTML =
        'Longitude: ' + lngLat.lng + '<br />Latitude: ' + lngLat.lat;

      //pass lat and lng

      const latInput = document.getElementById('place_latitude');
      const lngInput = document.getElementById('place_longitude');

      latInput.value = lngLat.lat;
      lngInput.value = lngLat.lng;
    }

    marker.on('dragend', onDragEnd);

    // Add geolocate control to the map.
    /*  map.addControl(
    new mapboxgl.GeolocateControl({
    positionOptions: {
    enableHighAccuracy: true
    },
    trackUserLocation: true
    })
    );*/

    //add zoomcontrol
    map.addControl(new mapboxgl.NavigationControl());
  }
};

export { draggableMap };
