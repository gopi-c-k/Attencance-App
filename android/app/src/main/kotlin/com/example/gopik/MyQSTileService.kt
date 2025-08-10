package com.classconnect.gopi

import android.content.Intent
import android.os.Build
import android.service.quicksettings.TileService
import android.util.Log
import androidx.annotation.RequiresApi
import android.service.quicksettings.Tile
import android.app.AlertDialog
import android.content.DialogInterface


import io.flutter.embedding.android.FlutterActivity

class MyQSTileService: TileService() {

  // Called when the user adds your tile.
  override fun onTileAdded() {
    super.onTileAdded()
  }
  // Called when your app can update your tile.
  override fun onStartListening() {
    super.onStartListening()
  }

  // Called when your app can no longer update your tile.
  override fun onStopListening() {
    super.onStopListening()
  }

  // Called when the user taps on your tile in an active or inactive state.
  
  var counter = 0
   override fun onClick() {
        super.onClick()

        if (qsTile.state == Tile.STATE_ACTIVE || qsTile.state == Tile.STATE_INACTIVE) {
            counter++
            qsTile.state = if (counter % 2 == 0) Tile.STATE_ACTIVE else Tile.STATE_INACTIVE
            qsTile.updateTile()
            if (qsTile.state == Tile.STATE_ACTIVE) {
                // Create an AlertDialog using applicationContext
                val builder = AlertDialog.Builder(applicationContext)
                builder.setTitle("Tile Clicked")
                builder.setMessage("Client ready!")
                builder.setPositiveButton("OK") { dialog: DialogInterface, _ ->
    dialog.dismiss()
}


                // Display the dialog
                val dialog = builder.create()
                dialog.show()
            }
            
            qsTile.label = "Clicked $counter times"
            qsTile.contentDescription = qsTile.label
            qsTile.updateTile()
        }
    }

  // Called when the user removes your tile.
  override fun onTileRemoved() {
    super.onTileRemoved()
  }
}