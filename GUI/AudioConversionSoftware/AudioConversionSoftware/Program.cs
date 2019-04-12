using System;
using System.Media;
using System.Threading;
using System.IO.Ports;

namespace AudioConversionSoftware
{
    class MainClass
    {
        private static bool _run;
        private static bool _setup;
        private static bool _shutdown;
        private static SerialPort _serialPort;

        public static void Main(string[] args)
        {
            string command;
            StringComparer stringComparer = StringComparer.OrdinalIgnoreCase;

            Console.WriteLine("------------- WELCOME TO THE AUDIO REVERB CONVERTER -------------\n" +
                "--------------------- Current Version: 0.01v --------------------\n" +
                "\n-> Please wait while we try and establish a connection to your physical device.");

            _serialPort = new SerialPort();
            _setup = true;

            while (_setup)
            {
                Console.WriteLine("-> More info needed to establish connection.");
                Console.WriteLine("-> To start process type ´start´");

                command = Console.ReadLine();

                if(stringComparer.Equals("start", command))
                {
                    Console.WriteLine("-> Starting connection setup");
                    _setup = false;
                }
                else if (stringComparer.Equals("quit", command))
                {
                    Console.WriteLine("-> Closing application, please wait.");
                    Thread.Sleep(3000); //WAIT FOR 3 SECONDS
                    _shutdown = true;
                    _setup = false;
                }
            }

            if (_shutdown) return;

            // Allow the user to set the appropriate properties.
            _serialPort.PortName = SetPortName(_serialPort.PortName);
            _serialPort.BaudRate = SetPortBaudRate(_serialPort.BaudRate);
            _serialPort.Parity = SetPortParity(_serialPort.Parity);
            _serialPort.DataBits = SetPortDataBits(_serialPort.DataBits);
            _serialPort.StopBits = SetPortStopBits(_serialPort.StopBits);
            _serialPort.Handshake = SetPortHandshake(_serialPort.Handshake);

            _serialPort.Open();

            _run = true;
            Console.WriteLine("-> Connection established, please input your commands.");

            while (_run)
            {
                command = Console.ReadLine();

                if (stringComparer.Equals("quit", command))
                {
                    Console.WriteLine("-> Closing application, please wait.");
                    Thread.Sleep(3000); //WAIT FOR 3 SECONDS
                    _run = false;
                }
                else if (stringComparer.Equals("run", command))
                {
                    Console.WriteLine("-> Please write in the filepath of the audio file you wish to alter:");

                    string filePath = Console.ReadLine();
                    var audioBytes = AudioConverter.Instance.FileToBytes(filePath);

                    if (audioBytes == null) break;

                    //TODO: Continue
                }
                else if (stringComparer.Equals("help", command))
                    Console.WriteLine("-> You can use the following commands: \n"
                        + "quit / run");
            }

            _serialPort.Close();
        }

        private static bool ArduinoConnection()
        {
            //TODO: Setup the connection with the serial port
            return false;
        }

        #region Serial Port Setters
        // Display Port values and prompt user to enter a port.
        public static string SetPortName(string defaultPortName)
        {
            string portName;

            Console.WriteLine("-> Available Ports:");
            foreach (string s in SerialPort.GetPortNames())
            {
                Console.WriteLine("   {0}", s);
            }

            Console.Write("-> Enter COM port value (Default: {0}): ", defaultPortName);
            portName = Console.ReadLine();

            if (portName == "" || !(portName.ToLower()).StartsWith("com"))
            {
                portName = defaultPortName;
            }
            return portName;
        }

        // Display BaudRate values and prompt user to enter a value.
        public static int SetPortBaudRate(int defaultPortBaudRate)
        {
            string baudRate;

            Console.Write("-> Baud Rate(default:{0}): ", defaultPortBaudRate);
            baudRate = Console.ReadLine();

            if (baudRate == "")
            {
                baudRate = defaultPortBaudRate.ToString();
            }

            return int.Parse(baudRate);
        }

        // Display PortParity values and prompt user to enter a value.
        public static Parity SetPortParity(Parity defaultPortParity)
        {
            string parity;

            Console.WriteLine("-> Available Parity options:");
            foreach (string s in Enum.GetNames(typeof(Parity)))
            {
                Console.WriteLine("   {0}", s);
            }

            Console.Write("-> Enter Parity value (Default: {0}):", defaultPortParity.ToString(), true);
            parity = Console.ReadLine();

            if (parity == "")
            {
                parity = defaultPortParity.ToString();
            }

            return (Parity)Enum.Parse(typeof(Parity), parity, true);
        }

        // Display DataBits values and prompt user to enter a value.
        public static int SetPortDataBits(int defaultPortDataBits)
        {
            string dataBits;

            Console.Write("-> Enter DataBits value (Default: {0}): ", defaultPortDataBits);
            dataBits = Console.ReadLine();

            if (dataBits == "")
            {
                dataBits = defaultPortDataBits.ToString();
            }

            return int.Parse(dataBits.ToUpperInvariant());
        }

        // Display StopBits values and prompt user to enter a value.
        public static StopBits SetPortStopBits(StopBits defaultPortStopBits)
        {
            string stopBits;

            Console.WriteLine("-> Available StopBits options:");
            foreach (string s in Enum.GetNames(typeof(StopBits)))
            {
                Console.WriteLine("   {0}", s);
            }

            Console.Write("-> Enter StopBits value (None is not supported and \n" +
             "raises an ArgumentOutOfRangeException. \n (Default: {0}):", defaultPortStopBits.ToString());
            stopBits = Console.ReadLine();

            if (stopBits == "")
            {
                stopBits = defaultPortStopBits.ToString();
            }

            return (StopBits)Enum.Parse(typeof(StopBits), stopBits, true);
        }

        public static Handshake SetPortHandshake(Handshake defaultPortHandshake)
        {
            string handshake;

            Console.WriteLine("-> Available Handshake options:");
            foreach (string s in Enum.GetNames(typeof(Handshake)))
            {
                Console.WriteLine("   {0}", s);
            }

            Console.Write("-> Enter Handshake value (Default: {0}):", defaultPortHandshake.ToString());
            handshake = Console.ReadLine();

            if (handshake == "")
            {
                handshake = defaultPortHandshake.ToString();
            }

            return (Handshake)Enum.Parse(typeof(Handshake), handshake, true);
        }
        #endregion
    }

    public class AudioConverter
    {
        #region Singleton
        private static AudioConverter _instance = null;
        private static readonly object _safety = new object();

        private AudioConverter()
        {
            //DEFAULT CONSTRUCTOR
        } 

        public static AudioConverter Instance
        {
            get
            {
                lock (_safety)
                {
                    if(_instance == null)
                    {
                        _instance = new AudioConverter();
                    }
                    return _instance;
                }
            }
        }
        #endregion

        public byte[] FileToBytes(string filePath)
        {
            if(!string.IsNullOrEmpty(filePath))
            {
                Console.WriteLine("SUCCESS: File converted");
                return System.IO.File.ReadAllBytes(filePath);
            }

            Console.WriteLine("!!Audio file not located!!");
            return null;
        }

        public bool BytesToFile(byte[] soundBytes, string filePath)
        {
            if(soundBytes != null && !string.IsNullOrEmpty(filePath))
            {
                System.IO.File.WriteAllBytes(filePath+".wav", soundBytes);
                return true;
            }

            Console.WriteLine("!!AUDIO SAVING PROCESS FAILED!!");
            return false;
        }

        public SoundPlayer GetSoundPlayer(byte[] soundBytes)
        {
            if (soundBytes == null)
            {
                Console.WriteLine("!!There's no data in this byte array!!");
                return null;
            }

            var soundPlayer = new SoundPlayer
            {
                Stream = new System.IO.MemoryStream(soundBytes)
            };

            return soundPlayer;
        }

        public SoundPlayer GetSoundPlayer(string filePath)
        {
            if (string.IsNullOrEmpty(filePath))
            {
                Console.WriteLine("!!Sound file could not be read!!");
                return null;
            }

            return new SoundPlayer(filePath);
        }
    }
}
