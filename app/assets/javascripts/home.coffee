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
      console.log result
      user = firebase.auth().currentUser
      console.log(user)
      user.refreshToken
    .then (idToken) ->
      # Send token to your backend via HTTPS
      console.log idToken
      window.location = "/auth/firebasetoken/callback?id_token=#{idToken}"
    .catch (error) ->
      # Handle Errors here.
      console.error(error)
  $('#js-firebase-google-auth').on 'click', ->
    provider = new firebase.auth.GoogleAuthProvider()
    firebase.auth().signInWithPopup(provider)
    .then (result) ->
      console.log result
      user = result.user
      console.log user.displayName
      console.log user.email
      result.credential.idToken
    .then (idToken) ->
      # Send token to your backend via HTTPS
      console.log idToken
      window.location = "/auth/firebasetoken/callback?id_token=#{idToken}"
    .catch (error) ->
      # Handle Errors here.
      console.error(error)

  $('#js-firebase-signout').on 'click', ->
    firebase.auth().signOut()
    .then(result) ->
      console.log(result)
    .catch (error) ->
      console.error(error)
