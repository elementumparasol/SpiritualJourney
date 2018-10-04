//
//  FlightData.swift
//  航班信息
//
//  Created by Enrica on 2018/10/4.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation

/// 航班数据(假数据)
struct FlightData {
    
    /// 航班起飞时间信息
    let summary: String
    
    /// 航班号
    let flightNr: String
    
    /// 登机口信息
    let gateNr: String
    
    /// 起飞地点
    let departingFrom: String
    
    /// 到达地点
    let arrivingTo: String
    
    /// 用于表示天气的图片名称
    let weatherImageName: String
    
    /// 是否显示天气效果图
    let showWeatherEffects: Bool
    
    /// 是否已经起飞
    let isTakingOff: Bool
    
    /// 航班状态
    let flightStatus: String
}


/// 上海飞哈尔滨
let shanghaiToHaerbin = FlightData(summary: "2018年10月4日 06: 40",
                                   flightNr: "南航CZ6438",
                                   gateNr: "太平T2",
                                   departingFrom: "上海",
                                   arrivingTo: "哈尔滨",
                                   weatherImageName: "bg-snowy",
                                   showWeatherEffects: true,
                                   isTakingOff: true,
                                   flightStatus: "已经起飞")


/// 哈尔滨飞三亚
let haerbinToSanya = FlightData(summary: "2018年10月4日 07: 45",
                                flightNr: "国航CA3547",
                                gateNr: "凤凰T2",
                                departingFrom: "哈尔滨",
                                arrivingTo: "三亚",
                                weatherImageName: "bg-sunny",
                                showWeatherEffects: false,
                                isTakingOff: false,
                                flightStatus: "延误")
