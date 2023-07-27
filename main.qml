import QtQuick 2.5
import QtQuick.Controls 2.5
import QtMultimedia

ApplicationWindow {
    visible: true
    width: 600
    height: 400
    title: "Play Videos"

    MediaPlayer {
        id: player
        source: "https://jsoncompare.org/LearningContainer/SampleFiles/Video/MP4/sample-mp4-file.mp4"
        audioOutput: audioOutput
        videoOutput: videoOutput
    }

    AudioOutput {
        id: audioOutput
        volume: volumeSlider.value
    }

    VideoOutput {
        id: videoOutput
        anchors.fill: parent
    }

    Component.onCompleted: {
        player.play()
    }

    Slider {
        id: volumeSlider
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 20
        orientation: Qt.Vertical
        value: 0.5
    }


    Slider {
        id: progressSlider
        width:parent.width
        anchors.bottom:parent.bottom
        enabled:player.seekable
        value: player.duaration > 0 ? player.position / player.duartion : 0


        onMoved: function(){
            player.position = player.duration * progressSlider.position
        }
    }
}


