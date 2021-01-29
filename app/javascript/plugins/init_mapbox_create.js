import mapboxgl from 'mapbox-gl';

// Map with draggables
const draggableMap = () => {
  const mapper = document.getElementById('mapper');
  const coordinates = document.getElementById('coordinates');
  if (mapper != null) {
    mapboxgl.accessToken = mapper.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
      container: 'mapper',
      style: 'mapbox://styles/mapbox/streets-v11',
      center: [-3.703551575565683, 40.41682800299995],
      zoom: 5,
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
