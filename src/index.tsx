import { NativeModules } from 'react-native';

type ComReactNativeDocPreviewType = {
  show(inputUrl: string, fileName: string): Promise<string>;
};

const { ComReactNativeDocPreview } = NativeModules;

export default ComReactNativeDocPreview as ComReactNativeDocPreviewType;
