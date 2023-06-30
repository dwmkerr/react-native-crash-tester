import { NativeModules } from 'react-native';

const { CrashTester: NativeModule } = NativeModules;

const CrashTester = {
  nativeCrash(message = ''): void {
    NativeModule.nativeCrash(message);
  },
  nativeException(message = ''): void {
    NativeModule.nativeException(message);
  },
  jsCrash(message?: string): void {
    throw new Error(message);
  },
  blockUIThread(sleepTimeSeconds: number): void {
    NativeModule.blockUIThread(sleepTimeSeconds);
  },
};

export default CrashTester;
export { default as CrashingComponent } from './CrashingComponent';
