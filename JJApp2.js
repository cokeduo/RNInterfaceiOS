import React, {Component} from 'react'
import {
    View,
    Text,
    StyleSheet,
} from 'react-native'


class JJApp2 extends Component{
    render(){
        return(
            <View style={styles.contentStyle}><Text style={{fontSize:30, color: 'red'}}>第二个reactnative视图</Text></View>
        )
    }
}

const styles = StyleSheet.create({
   contentStyle: {
       flex: 1,
       justifyContent: 'center',
       alignItems: 'center',
       backgroundColor: '#e3e4ef'
   }
});

export default JJApp2
