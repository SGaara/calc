import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.15

import API 1.0


Window {

    property int operation: 0;

    visible: true
    width: 640
    height: 480
    title: qsTr("Calculator")

    Text {
        id: textInput
        x: 41
        y: 45
        width: 558
        height: 44
        text: "0";
        font.weight: Font.Normal
        verticalAlignment: Text.AlignVCenter
        font.bold: true
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 40
    }
    Button {
        x: 47
        y: 294
        text: "1"
        onClicked: textInput.text=="0"?
                   textInput.text="1":
                   textInput.text+="1"
        }

    Button {
        x: 171
        y: 294
        text: "2"
        onClicked: textInput.text=="0"?
                   textInput.text="2":
                   textInput.text+="2"
    }

    Button {
        x: 297
        y: 294
        text: "3"
        onClicked: textInput.text=="0"?
                   textInput.text="3":
                   textInput.text+="3"
    }

    Button {
        x: 47
        y: 237
        text: "4"
        onClicked: textInput.text=="0"?
                   textInput.text="4":
                   textInput.text+="4"
    }

    Button {
        x: 171
        y: 237
        text: "5"
        onClicked: textInput.text=="0"?
                   textInput.text="5":
                   textInput.text+="5"
    }

    Button {
        x: 297
           y: 237
         text: "6"
         onClicked: textInput.text=="0"?
                    textInput.text="6":
                    textInput.text+="6"
    }

    Button {
        x: 47
        y: 179
        text: "7"
        onClicked: textInput.text=="0"?
                   textInput.text="7":
                   textInput.text+="7"
    }

    Button {
        x: 171
        y: 179
        text: "8"
        onClicked: textInput.text=="0"?
                   textInput.text="8":
                   textInput.text+="8"
    }

    Button {
        x: 297
        y: 179
        text: "9"
        onClicked: textInput.text=="0"?
                   textInput.text="9":
                   textInput.text+="9"
    }

    Button {
        x: 47
        y: 349
        width: 224
        height: 40
        text: "0"
        onClicked: textInput.text=="0"?
                   textInput.text="0":
                   textInput.text+="0"
    }

    Button {
        x: 297
        y: 349
        text: "."
        onClicked: {
            if(textInput.text.indexOf('.') == -1) textInput.text+="."
        }
    }

    Button {
        x: 421
        y: 294
        text: "-"
        onClicked: {
            operation = 2;
            API.first_value = parseFloat(textInput.text);
            textInput.text = "0";
        }
    }

    Button {
        x: 421
        y: 237
        text: "*"
        onClicked: {
            operation = 3;
            API.first_value = parseFloat(textInput.text);
            textInput.text = "0";
        }
    }

    Button {
        x: 421
        y: 179
        text: "/"
        onClicked: {
            operation = 4;
            API.first_value = parseFloat(textInput.text);
            textInput.text = "0";
        }
    }

    Button {
        x: 421
        y: 349
        text: "+"
        onClicked: {
            operation = 1;
            API.first_value = parseFloat(textInput.text);
            textInput.text = "0";
        }
    }

    Button {
        x: 47
        y: 123
        text: "\u2190"
        onClicked: {
            textInput.text = textInput.text.substring(0, textInput.text.length - 1);
            if(textInput.text.length == 0||textInput.text=="-") textInput.text = "0";
        }
    }

    Button {
        x: 171
        y: 123
        text: "CE"
        onClicked:{
            textInput.text="0";
            API.first_value = 0;
        }
    }

    Button {
        x: 297
        y: 123
        text: "C"
        onClicked: {
            textInput.text="0"
        }
    }

    Button {
        x: 421
        y: 123
        text: "\u00b1"
        onClicked: {
            if(textInput.text.indexOf("-")==-1&&textInput.text!="0")
                        textInput.text = "-"+textInput.text
            else if(textInput.text.indexOf("-")!=-1&&textInput.text!="0")
                        textInput.text = textInput.text.substring(1,textInput.text.length)
        }
    }

    Button {
        x: 533
        y: 294
        width: 100
        height: 95
        text: "="
        onClicked: {
            switch (operation) {
            case 0: console.log("Operation isn't defined"); break;
            case 1:
                textInput.text = API.add(parseFloat(textInput.text));
                operation = 0;
            break;
            case 2:
                textInput.text = API.minus(parseFloat(textInput.text));
                operation = 0;
            break;
            case 3:
                textInput.text = API.mult(parseFloat(textInput.text));
                operation = 0;
            break;
            case 4:
                if(textInput.text=="0") {
                    console.log("Operation isn't defined. Please try again.");
                    break;
                }
                textInput.text = API.del(parseFloat(textInput.text));
                operation = 0;
            break;
            }
        }
    }

    Button {
        x: 533
        y: 237
        text: "1/x"
        onClicked: textInput.text=="0"?
                       textInput.text="0":
                       textInput.text=(1/(parseFloat(textInput.text)))
    }

    Button {
        x: 533
        y: 179
        text: "%"
        onClicked: textInput.text = API.procent(parseFloat(textInput.text));
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.6600000262260437}
}
##^##*/
