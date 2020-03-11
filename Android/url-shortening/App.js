import React, { Component } from 'react';
import { StyleSheet, Text, View, TextInput, Button } from 'react-native';

export default class UrlShortener extends Component {
  constructor(props) {
    super(props);
    this.state = {text: ''};
  }
  async onFetchLoginRecords() {
let url = this.state.text;    
fetch('https://api.rebrandly.com/v1/links', {
      method: 'POST',
      headers: {
              "Content-Type": "application/json",
              "apikey": "323202f2999b4933b10daf4470594692"
            },
      body: JSON.stringify({
        "destination": url,
        "domain": { "fullName": "rebrand.ly" }
      })
})
    .then((response) => response.json())
    .then((responseJson) => {
        alert("Shortened URL for " + responseJson.destination + ":  " + responseJson.shortUrl);
    })
    .catch((error) => {
      console.error(error);
    });
}


  onPressSubmitButton() {
    this.onFetchLoginRecords();
    }

  render() {
    return (
      <View style={styles.container}>
        <TextInput
          style={{height: 40}}
          placeholder="Enter URL here!"
          onChangeText={(text) => this.setState({text})}
          value={this.state.text}
        />
        <Button
            onPress={this.onPressSubmitButton.bind(this)}
            title="Get URL"
          />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
