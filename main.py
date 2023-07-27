from PyQt6.QtQml import QQmlApplicationEngine
from PyQt6.QtWidgets import QApplication, QWidget
import sys


class Window(QWidget):
    def __int__(self):
        super().__init__()


app = QApplication(sys.argv)

engine = QQmlApplicationEngine()

window = Window()

engine.rootContext().setContextProperty('window', window)

engine.load('main.qml')

sys.exit(app.exec())

