import * as React from 'react';
import { StyleSheet, View, Text } from 'react-native';
import ComReactNativeDocPreview from 'com.react-native.doc-preview';

export default function App() {
  const [result, setResult] = React.useState<number | undefined>();

  React.useEffect(() => {
    ComReactNativeDocPreview.show("http://www.orimi.com/pdf-test.pdf", "pdf-test.pdf").then((response) => {
      console.log("ok", response)
    }).catch((error) => {
      console.log("error", error)
    });
  }, []);

  return (
    <View style={styles.container}>
      <Text>Result: {result}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
