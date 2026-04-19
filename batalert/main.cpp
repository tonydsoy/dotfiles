#include <iostream>
#include <fstream>
#include <unistd.h>

int main(int argc, char* argv[]) {
    bool verbose = false;
    for (int i = 1; i<argc; i++) {
        std::string argument = argv[i];
        if (argument == "-h") {
            std::cout << "use -v for verbose" << std::endl;
            return 0;
        } else if (argument == "-v") {
            std::cout << "verbose mode enabled, do not put this flag in any autostart cfgs." << std::endl;
            verbose = true;
        } else if (argument == "-p") {
            system("cat /sys/class/power_supply/BAT0/capacity");
            return 0;
        }
    }
    std::ifstream batfile;
    system("notify-send 'batteryalert' 'Started up successfully'");
    int previousBattery = 100;
    int batteryPercentage;
    for (;;) {
        sleep(1);
        system("rm /tmp/batalert.tmp");
        system("cat /sys/class/power_supply/BAT0/capacity >> /tmp/batalert.tmp");
        batfile.open("/tmp/batalert.tmp", std::ios::in);

        char chararray[4] = "___";
        chararray[4] = '\0';
        batfile.read(chararray,3);
        std::string batteryString = chararray;

        for (char& thing : batteryString) {
            if (thing == '\n') {
                batteryString.pop_back();
            }
        }

        if (verbose) {
            std::cout << batteryString << std::endl;
        }

        try {
            batteryPercentage = std::stoi(batteryString);
        } catch (std::out_of_range) {
            std::cerr << "battery percentage is not within int standards" << std::endl;
        } catch (std::invalid_argument) {
            std::cerr << "battery percentage is not an integer" << std::endl;
            return 1;
        }
        
        
        if (batteryPercentage <= 15 && previousBattery != batteryPercentage) {
            system("notify-send -u critical 'Battery Warning' 'Battery is at 15%'");
        }

        if (batteryPercentage <= 10 && previousBattery != batteryPercentage) {
            system("notify-send -u critical 'Battery Warning' 'Battery is at 10%'");
        }

        if (batteryPercentage <= 5 && previousBattery != batteryPercentage) {
            system("notify-send -u critical 'Battery Alert' 'Battery is at 5%'");
        }

        if (batteryPercentage <= 3 && previousBattery != batteryPercentage) {
            system("notify-send -u critical 'Battery Alert' 'Battery is at 2%'");
        }

        if (batteryPercentage <= 1 && previousBattery != batteryPercentage) {
            system("notify-send -u critical 'BATTERY ALERT!!' 'Battery is at 1%, Please charge or save unfinished work before imminent shutdown!'");
        }

        if (batteryPercentage <= 0 && previousBattery != batteryPercentage) {
            system("notify-send -u critical 'IMMINENT SHUTDOWN' 'how did we get here? 0%'");
        }

        previousBattery = batteryPercentage;

        batfile.close();
    }
}