import serial

class SeriellerPort:
    def __init__(self):
        self.__port__ = None

    def createPort(self , portName):
        pass

    def __readline__(self):
        text = self.__port__.readline()
        #print("empfange: {0}".format(text))
        #print("empfange: {0}".format(text.hex()))
        return text.decode("utf-8")

    def __write__(self , text):
        sendeText = bytearray(text, 'utf-8')
        #print("sende: {0}".format(sendeText))
        #print("sende: {0}".format(sendeText.hex()))

        self.__port__.write(sendeText)

    def testePort(self , portName):
        self.__port__ = serial.Serial(port=portName,
                                 baudrate=9600,
                                 timeout=10,
                                 parity=serial.PARITY_EVEN,
                                 bytesize=serial.EIGHTBITS,
                                 stopbits=serial.STOPBITS_ONE     )
        print(self.__readline__())
        print(self.__readline__())

        self.__write__("power on\r\n")
        print(self.__readline__())

        self.__write__('umdr 0.25 0.3\r\n')
        print(self.__readline__())
        print(self.__readline__())

        self.__write__('umdr 6 5\r\n')
        print(self.__readline__())
        print(self.__readline__())

        self.__write__('umdr -0.25 0.3\r\n')
        print(self.__readline__())
        print(self.__readline__())

        self.__write__("power off\r\n")
        print(self.__readline__())


if __name__ == "__main__":
    a = SeriellerPort()
    a.testePort("com4")