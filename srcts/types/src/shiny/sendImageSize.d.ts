import type { InputBatchSender } from "../inputPolicies";
import { Debouncer } from "../time";
declare class SendImageSize {
    regular: () => void;
    transitioned: () => void;
    setImageSend(inputBatchSender: InputBatchSender, doSendImageSize: () => void): Debouncer<typeof doSendImageSize>;
}
declare const sendImageSizeFns: SendImageSize;
export { sendImageSizeFns };
