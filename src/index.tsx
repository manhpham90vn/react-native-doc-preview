import { NativeModules } from 'react-native';

type ComReactNativeDocPreviewType = {
  multiply(a: number, b: number): Promise<number>;
};

const { ComReactNativeDocPreview } = NativeModules;

export default ComReactNativeDocPreview as ComReactNativeDocPreviewType;
