Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E755559A74
	for <lists.iommu@lfdr.de>; Fri, 24 Jun 2022 15:39:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C94514259F;
	Fri, 24 Jun 2022 13:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C94514259F
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hh7rxL72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NwUWnSvLFTDn; Fri, 24 Jun 2022 13:39:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3E92241841;
	Fri, 24 Jun 2022 13:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E92241841
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DEABDC0081;
	Fri, 24 Jun 2022 13:39:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 878F7C002D
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 13:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51EC341841
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 13:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51EC341841
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TnIQNFEDKjdx for <iommu@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 13:39:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6C7B41781
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2071.outbound.protection.outlook.com [40.107.102.71])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6C7B41781
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 13:39:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPJcIudzmy7WuHbPCxv1xjLge1nJ3kASwLwX0LlBhtgFFkHKDquWWm+t2NJ72jAc+GoEPHMN4JDi1SLaTVX+eE2Mi/pMYNVwTbriVMTSKklUiStsZvOFeA2UC9g6Opo/hDpyTX8crspDzYN8tCiCgvFxeLJIcD8y06aAbjSxUam5EjnILc3HX73Ub/U6cIHAABg5uyWGr2U3DwZpe5M6CKvkcW5BEXpHHPjVhVcHFSSnsU13VBlunVe+ZQd4nQtukMjgcxW8OARCZhKYFnr5aAXU+1YMZtRT+CuaP5Seje06kh1HIa7mjHqB1kNEiCeArL8ccyDrbR0QjhZO5qJWWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGlYcA07qLgF37l7X+9ZycBJcLp8VxO3IktFM1G+R88=;
 b=L0eoSs3hKbeHxo3AnDijBm6HpprdY65tTyUeupJlK4/Rh3ZhO7GbbElJdu07AzNZJqaqNlSddOIEWh5Do9jMb3PRnJT4ZGf5GbWGsnVo5tDuWxACVS5d9xxmDGn41a0/rQRw36WWJhwDnQWyuVsvXigoMGMs+CrV8KSWyaTis+hjIyNRZb2PLKu302iRALgPRuzUkSRxNFJutl1kkVHk6fObh0NipaRctmJZgjrgXP7JW9onjrox1RsV9upIRAWNG36J419qx8OIEc0P3U26QX2XkjBzm0349m6QFZ0XMpbq5A8CKYGKFfqY/xMA1xPfhRFMUk/YjDG5A5qphVGw0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGlYcA07qLgF37l7X+9ZycBJcLp8VxO3IktFM1G+R88=;
 b=hh7rxL723jAu8O3FsFQVtXVvK/3jO18cvGVrTqx8yVn1NS/jJhKpJrr6Kwy516moz95PLbeXOVwULyD2LUA13Yfa9PSDE3evCLAz6NyWHcmLcd0M13C5jQplgY/yZ6MhQNIhQBZL+NRSID8gt7GwV4+idJr07rnPSEqy1CFnOtACoP/07tzuddPga5IJecHMILjeYb+gxgjND2voE+7hHrFzVmO/0KsujEv7YC8v5mldHecD4qhW5pYJXys1lXc3vd5s/xZOyDBxgkH7BaDlQfUbu6qoz3tCruMkd8b2jS33Kr41xaha8quZ+pY9c0kLJrmhpbUbnjOH/5mTI5m6SA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB4173.namprd12.prod.outlook.com (2603:10b6:208:1d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 13:39:01 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5373.016; Fri, 24 Jun 2022
 13:39:01 +0000
Date: Fri, 24 Jun 2022 10:39:00 -0300
To: nobuhiro1.iwamatsu@toshiba.co.jp
Subject: Re: [PATCH 1/3] iommu: Add Visconti5 IOMMU driver
Message-ID: <20220624133900.GN4147@nvidia.com>
References: <20220525013147.2215355-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20220525013147.2215355-2-nobuhiro1.iwamatsu@toshiba.co.jp>
 <63369db0-cf7f-aa53-bf9f-de2b0b2289ac@linux.intel.com>
 <20220525182644.GF1343366@nvidia.com>
 <TYWPR01MB9420F74E27D8513CD2C2D27592B09@TYWPR01MB9420.jpnprd01.prod.outlook.com>
Content-Disposition: inline
In-Reply-To: <TYWPR01MB9420F74E27D8513CD2C2D27592B09@TYWPR01MB9420.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: MN2PR01CA0041.prod.exchangelabs.com (2603:10b6:208:23f::10)
 To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca0ad465-9239-4653-9e01-08da55e6e5ca
X-MS-TrafficTypeDiagnostic: MN2PR12MB4173:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QFOWHI+7M3d0wLEPtiJbY/Vo9v2vXiGnPWRbVsZYCdHZ9Aqw+jDAmliiM1epuEEvpmnbBq5yTenLJfaAGMioIrHEOX3s0cXLHqHPhDOsJHTh0aH5R/S8SyCcDXRZuvKAu5Rfv1w7/qKXX8zmRl0x+U9rPq3ueXv6evo73vClsb8AfLszDZZSoPmvqBAK9Gpj+InJTfc87HKMr+/subOyBDcWiK1NT6j3uPNkrnc+KYU2DDofHEUlTP4wpSO17v3FofXx9sXxYp6RJBGdDAu4qVW3W9ufmfweOHzLybnVIwNdqd6N2WWukpIijtGXP9iJedlAWGQc21Mq0sIwiBKmplIi4Zh87EIWqnByb/gdTG7R8Z+2rpn+G/XU8PafESbKK09dTriy26f6Z3HsUGfjpK8f0ILNSaxQnhIdWghMRkslCxyHq2BVC+Skv/MdcAXfz18MH4vmqHCRkWcwXLTgMKd6C7qAwFFpEGAM+QqxKBu9jlRFdX61tjZ4eoLRRdmfXyyKiJwu2qbJPkyfmBQwC83WD9R1J+u6VMmjeWQr34csFEcw0pnQNL07flzPKYqns8UgtT/VB8m2HUcRWk+OR9JWquYn1OdZdwYlXexSOReVJFTZQ2IW/BLQ0o/4qBRbaTisfcEN2D3P1uJiGSKxRGb/Ph4Pv2qlFtGOxFFSt45+czErZydArumrDxXiaGg2b5XCnfDHp0Z0SbbSAL3lnKSRkC0zw4STm6kYT/Z3RUBYi/mn+ndgxqSdRAhfGYB1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(83380400001)(316002)(33656002)(478600001)(8676002)(6506007)(34206002)(2616005)(8936002)(6512007)(53546011)(26005)(41300700001)(66946007)(1076003)(186003)(66476007)(4326008)(66556008)(2906002)(5660300002)(38100700002)(36756003)(86362001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a05LUGIrZFZncnJwR1Z1Y1JSK0NvMDc1b1N3YVJBSGpzTUVUVFJBdWVBQ1Jm?=
 =?utf-8?B?bEhUSDFJR25HTUFlelhIOVFULzBRZDBRZzZsUVJoTHRaZFIwa3ZCM0tncWlo?=
 =?utf-8?B?QmczMFN1ZkRkK3ZSaFFRQ09IZi82TkVrbHFhNUpyZVFwUWlCbWxiek5JQVp2?=
 =?utf-8?B?N3pDYTdwY1l1Q3FiWWdmWWE0SEtQUHE3UXR5bEl4MWN2cDV0S1ZGNUVhbHJG?=
 =?utf-8?B?UzB6TTlNUkFubkFyRDR2a29nRUR6T0s4eTJQV0dZUXZpSHJGRDZOc1J1N3p5?=
 =?utf-8?B?QTVMallQZnIxMDB3Rm44dzIvbUs2R09Yd2U2UkRmbXovNG9ZQW9aR1lFakVI?=
 =?utf-8?B?MWthTndkdGlGNXV5OVJJdGZHYnRlVStXWUxDRTBFMzM1Y01ZT292UHdPdTRH?=
 =?utf-8?B?WWRHMVN1Vmg4a3FwZFMxVzVQNEVHZUVTVW82c21LaGZFSWNhK2Fma2VQM1h3?=
 =?utf-8?B?cmNvTWhrTExqN2NYYVk4VVJwUTZFSGlHNC9GVklQQUZiZ1dmS2NheU1Pclk1?=
 =?utf-8?B?LytNVUwzQ0NHSGd2c3ZVOE53ZHZNVk43Q1B6V2k1VWJwVFR4ampkbFMyenJ3?=
 =?utf-8?B?aUF1NzRqWlNFTnliUGFjNUE4VmM4c0VuV00rTVJJOXlRb09Fd28ydHBxQld6?=
 =?utf-8?B?RG13WThxdjd1S2RVT1lHV0lEazNpeGhGM0lINGJiMU5xS2t1Uk5qZzBjYTJj?=
 =?utf-8?B?MDFYWVdER2RGL3p4Wjl3bVE0a1hoRlhLSnI0L3FwV1hnMHlOcWY4d3hLQngx?=
 =?utf-8?B?RFAwN0s0NnZNMUVzS3NLVlpRYU0yNk1sNFUwa3JpYTI0UVl6Rit1WFgwazdE?=
 =?utf-8?B?RkEvSWIzb3VMNUh3ZnUrc3dadmNEdnAvR01OandrL2NhUjNIZzJBZlI5VEJp?=
 =?utf-8?B?TDJOeHIrVTFRaGl2M3Ywak5PdnlDdlhraFlpaWdrSVNsS0dqYStXQzNjT001?=
 =?utf-8?B?ZGkyQzdZRXF4YllzRnk1ZjB2K2dNOFFNTVQ2L2V5SlM3RnlaL2g5Z3BRTml3?=
 =?utf-8?B?bFptajRUVHUrWXJENUtpYmFobFVmWEhYSGdHNUVRQzBCZUVLcHRNVkhpYm9i?=
 =?utf-8?B?WmxtSk1td1VuT0djZDdNWUViT3d2S1NGR1pxRDZHbThCYitkNGxBckxYQTI0?=
 =?utf-8?B?Z2tGdlkyRks5T1JrV0thQ0h6ZGVOeXJHaEpyR3h0Ly9sdXNFY05iczUvUXls?=
 =?utf-8?B?YkpyNFhCVEJNL2pXNHJxcEpYY3RkdnJIajhaMFlPdXFyMm9iaHlNak4wdUNr?=
 =?utf-8?B?OFJPdkd4cmFWVk8ySS9oajNJa1UxTmpPekgvSk1WTVF4WnhVZDU3dEkxUEE3?=
 =?utf-8?B?eDYySXBXeDhVUWd5NUwyNTY4enlHSDF0bTlRQ3pDS0J1WmVKZ1Q4ZFFURXVU?=
 =?utf-8?B?c1VzWDMxejk3N2owTnZrNFh6YVFRYXNSTE00bmJhSDVVQ2hLWjVaUTcyY2t0?=
 =?utf-8?B?VjlsaG52T2xBNU5sZ2huakg3cHVJUGFObVRvdGxCOE0wTmlieTR2QmMvUUFZ?=
 =?utf-8?B?ZjFYMjlCZ1c4M3JLa2VlbFAyd0tzKzYrZ2RmYU1qQmd0SUVSWFc5MXltcFYz?=
 =?utf-8?B?dGlTV0RxdFpFOVJ6bUMwYlk0OUMvemRLRmIzK2lKNzVVUmlmSUZwdGRRb29U?=
 =?utf-8?B?eU4zZ3Y1V3Q2M0N1clQvZnZxeE9zclhlb0g3aWdpRVJDZVpSU3ZFYm41K0hK?=
 =?utf-8?B?RUxDNEg5Q0V5T1p6c1pGVEZKNmlJZm1rdzEybjM5WkdiVUgrZE9QN2lyeU51?=
 =?utf-8?B?ajhMR0hxSmNVQnNjam9kWVl3K250czZZclNHenBPSGZvMTRCSjFCU1hwalpm?=
 =?utf-8?B?S0JuMnJDanZUVi9ZUThwOGVWMWt6TTBidHlPdUZqNE5NcTVKeFNpMkJOQUFh?=
 =?utf-8?B?OTRBN21BZGdIRmF0ZU9RRXNGdXVJN1J2eCtSaDJKa0FSSkxCNnViUHorTXdw?=
 =?utf-8?B?UnZUOXhadDhYM0FUeS9Td0dHdVRjWTczK2U1WUhyc0VRUnRJT2pEenpPN2li?=
 =?utf-8?B?bDlVcXJLZDZEWFFveDRRNGpvdC9KcU5MZzc4Lyt2bjYybEZrYnFjUjFzVnp2?=
 =?utf-8?B?cXpCenNhUjFzZUhiT3pqb1NqY0VWS1NMRDVoSjRjaEdKaFVuNVl5VUg4WEJI?=
 =?utf-8?Q?41NHhE0RXbkl61xxE3Ht+Grww?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0ad465-9239-4653-9e01-08da55e6e5ca
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 13:39:01.4477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bILEbS/3yVcqfPlcosz1W5e1w+YmP2yGSRzqXG8pq4JmCe0aJnV0QdiR83iMLTMM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4173
Cc: devicetree@vger.kernel.org, yuji2.ishikawa@toshiba.co.jp,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 robh+dt@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
From: Jason Gunthorpe via iommu <iommu@lists.linux-foundation.org>
Reply-To: Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

T24gTW9uLCBKdW4gMjAsIDIwMjIgYXQgMDU6NDk6MTNBTSArMDAwMCwgbm9idWhpcm8xLml3YW1h
dHN1QHRvc2hpYmEuY28uanAgd3JvdGU6Cj4gSGksCj4gCj4gVGhhbmtzIGZvciB5b3VyIHJldmll
dy4KPiAKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBKYXNvbiBHdW50
aG9ycGUgPGpnZ0BudmlkaWEuY29tPgo+ID4gU2VudDogVGh1cnNkYXksIE1heSAyNiwgMjAyMiAz
OjI3IEFNCj4gPiBUbzogQmFvbHUgTHUgPGJhb2x1Lmx1QGxpbnV4LmludGVsLmNvbT4KPiA+IENj
OiBpd2FtYXRzdSBub2J1aGlybyjlsqnmnb4g5L+h5rSLIOKWoe+8s++8t++8o+KXr++8oe+8o++8
tCkKPiA+IDxub2J1aGlybzEuaXdhbWF0c3VAdG9zaGliYS5jby5qcD47IEpvZXJnIFJvZWRlbCA8
am9yb0A4Ynl0ZXMub3JnPjsgV2lsbAo+ID4gRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+OyBSb2Ig
SGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsKPiA+IGRldmljZXRyZWVAdmdlci5rZXJuZWwu
b3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOwo+ID4gaW9tbXVAbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmc7IGlzaGlrYXdhIHl1amko55+z5bedIOaCoOWPuCDil4vvvLLvvKTvvKPi
lqHvvKHvvKnvvLQKPiA+IO+8o+KXi++8pe+8oemWiykgPHl1amkyLmlzaGlrYXdhQHRvc2hpYmEu
Y28uanA+Owo+ID4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDEvM10gaW9tbXU6IEFkZCBWaXNjb250aTUgSU9NTVUgZHJpdmVyCj4g
PiAKPiA+IE9uIFdlZCwgTWF5IDI1LCAyMDIyIGF0IDAyOjI2OjM3UE0gKzA4MDAsIEJhb2x1IEx1
IHdyb3RlOgo+ID4gPiBPbiAyMDIyLzUvMjUgMDk6MzEsIE5vYnVoaXJvIEl3YW1hdHN1IHdyb3Rl
Ogo+ID4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGlvbW11X29wcyB2aXNjb250aV9hdHVfb3Bz
ID0gewo+ID4gPiA+ICsJLmRvbWFpbl9hbGxvYyA9IHZpc2NvbnRpX2F0dV9kb21haW5fYWxsb2Ms
Cj4gPiA+ID4gKwkucHJvYmVfZGV2aWNlID0gdmlzY29udGlfYXR1X3Byb2JlX2RldmljZSwKPiA+
ID4gPiArCS5yZWxlYXNlX2RldmljZSA9IHZpc2NvbnRpX2F0dV9yZWxlYXNlX2RldmljZSwKPiA+
ID4gPiArCS5kZXZpY2VfZ3JvdXAgPSBnZW5lcmljX2RldmljZV9ncm91cCwKPiA+ID4gPiArCS5v
Zl94bGF0ZSA9IHZpc2NvbnRpX2F0dV9vZl94bGF0ZSwKPiA+ID4gPiArCS5wZ3NpemVfYml0bWFw
ID0gQVRVX0lPTU1VX1BHU0laRV9CSVRNQVAsCj4gPiA+ID4gKwkuZGVmYXVsdF9kb21haW5fb3Bz
ID0gJihjb25zdCBzdHJ1Y3QgaW9tbXVfZG9tYWluX29wcykgewo+ID4gPiA+ICsJCS5hdHRhY2hf
ZGV2ID0gdmlzY29udGlfYXR1X2F0dGFjaF9kZXZpY2UsCj4gPiA+ID4gKwkJLmRldGFjaF9kZXYg
PSB2aXNjb250aV9hdHVfZGV0YWNoX2RldmljZSwKPiA+ID4KPiA+ID4gVGhlIGRldGFjaF9kZXYg
Y2FsbGJhY2sgaXMgYWJvdXQgdG8gYmUgZGVwcmVjYXRlZC4gVGhlIG5ldyBkcml2ZXJzCj4gPiA+
IHNob3VsZCBpbXBsZW1lbnQgdGhlIGRlZmF1bHQgZG9tYWluIGFuZCBibG9ja2luZyBkb21haW4g
aW5zdGVhZC4KPiA+IAo+ID4gWWVzIHBsZWFzZSwgbmV3IGRyaXZlcnMgbmVlZCB0byB1c2UgZGVm
YXVsdF9kb21haW5zLgo+ID4gCj4gPiBJdCBpcyB2ZXJ5IHN0cmFuZ2UgdGhhdCB2aXNjb250aV9h
dHVfZGV0YWNoX2RldmljZSgpIGRvZXMgbm90aGluZy4gIEl0IGlzIG5vdAo+ID4gcmVxdWlyZWQg
dGhhdCBhIGRvbWFpbiBpcyBmdWxseSB1bm1hcHBlZCBiZWZvcmUgYmVpbmcgZGVzdHJ1Y3RlZCwg
SSB0aGluawo+ID4gZGV0YWNoIHNob3VsZCBzZXQgQVRVX0FUX0VOIHRvIDAuCj4gCj4gSSBzZWUs
IEkgcmV0aGluayBpbXBsZW1lbnRhdGlvbi4KPiAKPiA+IAo+ID4gV2hhdCBiZWhhdmlvciBkb2Vz
IHRoZSBIVyBoYXZlIHdoZW4gQVRVX0FUX0VOVFJZX0VOID09IDA/IElmIERNQSBpcwo+ID4gcmVq
ZWN0ZWQgdGhlbiB0aGlzIGRyaXZlciBzaG91bGQgaGF2ZSBhIElPTU1VX0RPTUFJTl9CTE9DS0lO
RyBhbmQKPiA+IHJldHVybiB0aGF0IGZyb20gb3BzLT5kZWZfZG9tYWluX3R5cGUoKS4KPiAKPiBJ
ZiBBVFVfQVRfRU5UUllfRU4gaXMgMCwgbm90aGluZyBoYXBwZW5zLiBJdCBkb2VzIG5vdCB3b3Jr
IHdpdGggSU9NTVUsCj4gaXQgd29ya3Mgd2l0aCB0aGUgbWVtb3J5IHNwYWNlIHNldCBpbiBkZXZp
Y2UgdHJlZS4KClNvIHRoYXQgd291bGQgYmUgYW4gYXNzaWdubWVudCB0byBET01BSU5fSURFTlRJ
VFkKCj4gPiBJJ20gZmVlbGluZyBsaWtlIHRoZXNlICJzcGVjaWFsIiBkcml2ZXJzIG5lZWQgc29t
ZSBraW5kIG9mIGhhbmRzaGFrZSB3aXRoIHRoZWlyCj4gPiBvbmx5IHVzZXJzIGJlY2F1c2UgdGhl
eSBkb24ndCB3b3JrIHdpdGggdGhpbmdzIGxpa2UgVkZJTy4uCj4gCj4gU2luY2UgdGhlIGRldmlj
ZXMgdGhhdCB1dGlsaXplIHRoaXMgSU9NTVUgZnVuY3Rpb24gYXJlIGZpeGVkLCBJIGRvCj4gbm90
IHRoaW5rIHRoYXQgYSBzcGVjaWFsIGhhbmRzaGFrZSBpcyByZXF1aXJlZC4gIENvdWxkIHlvdSB5
b3UgdGVsbAo+IG1lIHdoZXJlIHlvdSB0aG91Z2h0IHlvdSBuZWVkZWQgYSBoYW5kc2hha2U/CgpJ
biB0aGlzIGNhc2UgdGhlIGlvbW11IGRyaXZlciBpcyBzbyBsaW1pdGVkIHRoYXQgaXQgd2lsbCBu
b3Qgd29yayB3aXRoClZGSU8gLSBpdCBpcyBvbmx5IG1lbnQgdG8gYmUgdXNlZCB3aXRoIHRoZSBm
aXhlZCBkcml2ZXJzIHRoYXQgYXJlCnBhaXJlZCB3aXRoIGl0LgoKSWRlYWxseSB3ZSdkIHByZXZl
bnQgVkZJTyBmcm9tIGNvbm5lY3RpbmcgYW5kIG9ubHkgYWxsb3cgZHJpdmVycyB0aGF0Cmtub3cg
dGhlIGxpbWl0YXRpb25zIG9mIHRoZSBJT01NVSB0byB1c2UgdGhlIHVubWFuYWdlZCBkb21haW4u
CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
b21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
