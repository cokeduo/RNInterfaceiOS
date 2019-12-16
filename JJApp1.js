import React, {Component} from 'react';
import {
    View,
    Text,
    StyleSheet,
    DeviceEventEmitter,     // ios 调用 rn
    NativeModules,          // rn 调用 iOS
    Button,
} from 'react-native';

const NativeInteraction = NativeModules.NativeInteraction;  // NativeInteraction 为iOS原生类


class JJApp1 extends Component {
    constructor(props) {
        super(props);
        this.state = {
            notice: '默认值',
        }
    }


    // ios 调用 RN 注册监听
    componentDidMount(): void {
        // 监听带有参数通知
        DeviceEventEmitter.addListener('EventWithInfo', (msg) => {
            let receive = "RN收到iOS消息，参数是：" + msg;
            console.log(receive);
            this.setState({notice: receive});
        });

        // 监听不带参数的通知
        DeviceEventEmitter.addListener('EventWithoutInfo', () => {
            let receive = "RN收到iOS消息，不带参数";
            console.log(receive);
            this.setState({notice: receive});
        });
    }

    transferIOS = () => {
        NativeInteraction.RNCallIOSWithoutParams();
    }


    transferIOS1 = ()=> {
        NativeInteraction.RNCallIOSWithParameter('123');
    }


    transferIOS2 = ()=> {
        NativeInteraction.RNCallIOSWithCallBack((data) => {
            this.setState({notice: data});
        });
    }

    transferIOS3 = ()=> {
        NativeInteraction.RNCallIOSWithParameterAndCallBack('rn_param1', 'rn_param2').then(result => {
            let jsonString = JSON.stringify(result);
            this.setState({notice: jsonString});
        }).catch(error=>{
            console.error(error);
        });
    }

    render() {
        return(
            <View style={styles.contentStyle}>
                <Text style={{fontSize: 30, color: 'red'}}>第一个reactnative视图</Text>
                <Text style={{fontSize: 15, color: 'purple'}}>{this.state.notice}</Text>

                <View style={{height:30}}></View>

                <Button
                    onPress={this.transferIOS}
                    title="RN调用iOS（无回调无参数）"
                    color="#841584"
                />
                <Button
                    onPress={this.transferIOS1}
                    title="RN调用iOS（有参数）"
                    color="#841584"
                />
                <Button
                    onPress={this.transferIOS2}
                    title="RN调用iOS（有回调）"
                    color="#841584"
                />
                <Button
                    onPress={this.transferIOS3}
                    title="RN调用iOS（有参数有回调）"
                    color="#841584"
                />
            </View>
        )
    }
}

const styles = StyleSheet.create({
    contentStyle: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: 'orange',
    },
});

export default JJApp1;
