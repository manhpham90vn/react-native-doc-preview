import * as React from 'react';
import { StyleSheet, TouchableOpacity, Text } from 'react-native';
import ComReactNativeDocPreview from 'com.react-native.doc-preview';

const open = () => {
  ComReactNativeDocPreview.show("http://www.orimi.com/pdf-test.pdf", "pdf-test.pdf").then((response) => {
    console.log("ok", response)
  }).catch((error) => {
    console.log("error", error)
  });
}

export default function App() {

  return (
    <TouchableOpacity style={styles.container} onPress={open}>
      <Text>Open</Text>
    </TouchableOpacity>
  );

}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
