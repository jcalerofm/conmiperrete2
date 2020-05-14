import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


const initMapboxCenter = (center) => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
  // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    let map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mcstr/cka6i589m0l6a1inpx23bkzie',
      center: [center[1], center[0]],
      zoom: 10
    });

     //change layer from streets to satellite
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
    // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
    //                                   mapboxgl: mapboxgl }));
  }
};

export { initMapboxCenter };
