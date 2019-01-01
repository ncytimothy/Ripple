# Ripple

This app allows users to send gratitude messages to their friends and family. Users will tag a feeling to each of 
their messages and they can see the history of their messages sent! Users can also see suggested quotes for inspiration, 
downloaded from the TheySaidSo API

## Getting Started

Download the Xcode project from the download menu

### Prerequisites

- You may review the codebase, but possibly may not be able to run the app since the API key is not available in the repo




## Authors

* **Timothy Ng** - [Timothy Ng](https://github.com/ncytimothy)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Udacity's iOS Developer Nanodegree program


# App Description
Home View Controller: 
- This is where the user can write their gratitude messages
- They can review hints on how to send a message
- They will also be able to personalize the header text to their name and also track how many messages are sent (persisted locally)
- They can finally send the messages and will be passed to the Check In View Controller

Check In View Controller:
- User will see a menu of feelings/emojis to be tagged to their messages
- The emojis are persisted locally on the device 
- When the user taps on "Send", the button will check if SMS services are available on the device (to prevent crashing)
- If SMS services are available, then the user will be prompted with MFMessasgeComposeViewController UI
