alias SDU='sudo /usr/bin/tail -f /greengrass/v2/logs/SensorDataUploader.log'
alias RSDU='sudo /greengrass/v2/bin/greengrass-cli component restart --names SensorDataUploader'

alias TI='sudo /usr/bin/tail -f /greengrass/v2/logs/TransceiverInterface.log'
alias RTI='sudo /greengrass/v2/bin/greengrass-cli component restart --names TransceiverInterface'

alias CI='sudo /usr/bin/tail -f /greengrass/v2/logs/CloudInterface.log'
alias RCI='sudo /greengrass/v2/bin/greengrass-cli component restart --names CloudInterface' 

alias CH='sudo /usr/bin/tail -f /greengrass/v2/logs/ConfigHandler.log'
alias RCH='sudo /greengrass/v2/bin/greengrass-cli component restart --names ConfigHandler'  

alias FC='sudo /usr/bin/tail -f /greengrass/v2/logs/FirmwareCourier.log'
alias RFC='sudo /greengrass/v2/bin/greengrass-cli component restart --names FirmwareCourier'

alias HR='sudo /usr/bin/tail -f /greengrass/v2/logs/HealthReporter.log'
alias RHR='sudo /greengrass/v2/bin/greengrass-cli component restart --names HealthReporter' 

alias LC='sudo /usr/bin/tail -f /greengrass/v2/logs/LEDController.log'
alias RLC='sudo /greengrass/v2/bin/greengrass-cli component restart --names LEDController'  

alias TA='sudo /usr/bin/tail -f /greengrass/v2/logs/TimesyncAgent.log'
alias RTA='sudo /greengrass/v2/bin/greengrass-cli component restart --names TimesyncAgent'

alias GG='sudo /usr/bin/tail -f /greengrass/v2/logs/greengrass.log'

alias thingname='sudo cat /greengrass/v2/config/effectiveConfig.yaml | grep -i thingname'  