import { Controller } from "@hotwired/stimulus"
import $ from 'jquery'
import jQueryBridget from 'jquery-bridget'
import Isotope from 'isotope-layout'
import { jsonToString } from "webpack/lib/Stats";

export default class extends Controller {
  connect() {
    jQueryBridget('isotope', Isotope, $);

    $(function () {

      let myVarsJSON = $("#my_vars_json").html(),
        myVars = JSON.parse(myVarsJSON)

      const playlistId = myVars['playlist']['id']
      const userId = myVars['user_id']
      const userToken = myVars['user_token']
      const baseUrl = 'https://api.spotify.com/v1'

      var $grid = $('.grid').isotope({
        itemSelector: '.grid-item-playlist',
        layoutMode: 'fitRows',
        transitionDuration: '0.6s',
        getSortData: {
          bpm: function (itemElem) {
            var bpm = $(itemElem).find('.bpm').text();
            return parseFloat(bpm.replace(/[\(\)]/g, ''));
          },
          key: function (itemElem) {
            var key = $(itemElem).find('.key').text();
            return parseInt(key.replace(/[\(\)]/g, ''));
          },
          danceability: function (itemElem) {
            var danceability = $(itemElem).find('.danceability').text();
            return parseFloat(danceability.replace(/[\(\)]/g, ''));
          },
          energy: function (itemElem) {
            var energy = $(itemElem).find('.energy').text();
            return parseFloat(energy.replace(/[\(\)]/g, ''));
          }
        },
        sortAscending: {
          originalOrder: true,
          key: false,
          bpm: false,
          danceability: false,
          energy: false
        }
      });

      $('.sort-by-button-group').on('click', 'button', function () {
        var sortByValue = $(this).attr('data-sort-by');
        $grid.isotope({ sortBy: sortByValue });
      });



      $('.update-playlist-button').on('click', function () {
        // Get current order of tracks
        var elems = $grid.isotope('getFilteredItemElements')
        const newTrackUris = elems.map(track => {
          return track.dataset.uriValue
        })

        // Replace the playlist tracks on spotify
        $.ajax({
          url: `${baseUrl}/playlists/${playlistId}/tracks`,
          type: "PUT",
          dataType: 'json',
          headers: {
            'Authorization': "Bearer " + userToken,
            'Content-Type': 'application/json' },
          data: JSON.stringify({
            'uris': newTrackUris,
          }),
          success: function () {
            alert(`Playlist Updated Successfully!`);
            // Refresh the page.
            location.reload(true);
          },
          error: function () {
            alert(`Playlist Update Failed`);
          }
        });
      });

      $('.create-playlist-button').on('click', function () {
        // Get current order of tracks
        var elems = $grid.isotope('getFilteredItemElements')
        const newTrackUris = elems.map(track => {
          return track.dataset.uriValue
        })

        // Create new empty playlist
        $.ajax({
          url: `${baseUrl}/users/${userId}/playlists`,
          type: "POST",
          dataType: 'json',
          headers: {
            'Authorization': "Bearer " + userToken,
            'Content-Type': 'application/json'
          },
          data: JSON.stringify({
            'name': `${myVars['playlist']['name']} by BiteJockey`,
            'description': 'Created by BiteJockey.'
          }),
          success: function(response) {
            const newPlaylistId = response['id']
            // Call function to insert tracks into new empty playlist.
            insertTracks(newPlaylistId)
          },
          error: function () {
            alert(`Playlist Creation Failed`);
          },
        });

        function insertTracks(playlistId){
          $.ajax({
          url: `${baseUrl}/playlists/${playlistId}/tracks`,
          type: "POST",
          dataType: 'json',
          headers: {
            'Authorization': "Bearer " + userToken,
            'Content-Type': 'application/json'
          },
          data: JSON.stringify({
            'uris': newTrackUris,
            'position': 0
          }),
          success: function () {
            alert(`Playlist Creation Successful!`);
            // Refresh the page.
            location.reload(true);
          }
        });
      }
      });
    });
  };
};
