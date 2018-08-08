$ ->
#  firebase.auth().onAuthStateChanged (user) ->
#    if user
#      # User is signed in.
#      user.getToken(true).then (idToken) ->
#        # Send token to your backend via HTTPS
#        console.log idToken
#        window.location = "/auth/firebasetoken/callback?id_token=#{idToken}"
#    else
#      # No user is signed in.

  $('#js-firebase-auth').on 'click', ->
    firebase.auth().signInAnonymouslyAndRetrieveData()
    .then (result) ->
      user = firebase.auth().currentUser
      user.getIdToken(true)
    .then (idToken) ->
      # Send token to your backend via HTTPS
      window.location = "/auth/firebasetoken/callback?id_token=#{idToken}"
    .catch (error) ->
      # Handle Errors here.
  $('#js-firebase-google-auth').on 'click', ->
    provider = new firebase.auth.GoogleAuthProvider()
    firebase.auth().signInWithPopup(provider)
    .then (result) ->
      user = firebase.auth().currentUser
      user.getIdToken(true)
    .then (idToken) ->
      # Send token to your backend via HTTPS
      window.location = "/auth/firebasetoken/callback?id_token=#{idToken}"
    .catch (error) ->
      # Handle Errors here.

  $('#js-firebase-signout').on 'click', ->
    firebase.auth().signOut()
    .then(result) ->
    .catch (error) ->
