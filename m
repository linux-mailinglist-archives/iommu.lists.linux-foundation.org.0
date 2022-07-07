Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CAF56A3AF
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 15:31:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAD718407E;
	Thu,  7 Jul 2022 13:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAD718407E
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector2 header.b=Wev+E8hZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O4wtyHlwrm8q; Thu,  7 Jul 2022 13:31:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9153E84082;
	Thu,  7 Jul 2022 13:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9153E84082
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58B76C007D;
	Thu,  7 Jul 2022 13:31:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CEF9C002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 13:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44A8D4097B
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 13:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44A8D4097B
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256
 header.s=selector2 header.b=Wev+E8hZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nhqi7dzzKhua for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 13:31:17 +0000 (UTC)
X-Greylist: delayed 03:51:34 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E45B40275
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E45B40275
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 13:31:17 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26793X85010169;
 Thu, 7 Jul 2022 09:37:42 GMT
Received: from eur03-dba-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2173.outbound.protection.outlook.com [104.47.51.173])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3h5a2tb6df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 09:37:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzwdYqa/ciDu9uUT6A/hOLSW2KUiYx+8AyqwWyl7GuqAqUoq90AORDVHV30kOwFHv2Q2UBdrw+z/1u1wfeB2lZewVcRYVzibmrzCN2T4cj2lbv/Uw/vIPkKL5efGTNVbjkg855abbFpypXfqPCl61eU7PJBtKIUJscj60QaaQCJ1GGGrxLshlLYb79e6K9NkFRH9ZWVQbV9XoTnli0yH1N+8ZP0UTbAyY+slD+U8wSvlnD4HtqStJUzYHvzm83baEWJgTqhyHGsGxsIyulxlx8NcKsmHoV22H95cXtU2lf/O0IniqpZrJNk4Fv1/VIfXGDS3PtOKC6/n9uV97ol05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruarQZmNj43SLW9TQWws2/Vu+4+WGtOYXsQcS/yMp6E=;
 b=Ziwr9X+k1nNJK2MT+8tESLGPWl4okA4jmQ5Ew23viNW3jUsHTVmA5N2f35WxlhDUeAiFZi9Kr+5C0UBgQERWH7iBVT6eVjN8ZTI0rplnma8wZHVeNbRgQUyMRJ4x7/d2H7SYlKUtRLgRWGTrtSPcju1Cir7yL07py73FNPl/BYRfmZtwPYqB0F4UyXWnbSXeADVThBYs0KTl4Kd/W/wtL1iHNz5WUvlOj+s1H+jANeq3dhRJ0rG5P6NRwcD9kSx5wc86f7S9FsruImI1G+xXk4Jx7f+u3ZwveFJQxp2Puf2Nny6+9OQlAnEFvX2wCim4+wEiJZM9ghIRl5TjUXgcdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruarQZmNj43SLW9TQWws2/Vu+4+WGtOYXsQcS/yMp6E=;
 b=Wev+E8hZQ4m8qoqDrosX+H5/hR7Bpmpms+Uc80EHMcO5HWQlEmZK8rH6mIMdjCO3afJkzZnoMBdTiU/1LPmn3RZIMQPLaT2jb5gqg5zNR20y+Jk2KVvrDNH09hBsN91m5G53IPznF1oRL4v3fXV0l4SGlvwenes/ZHQfqKSrkNy1k1iwLooxRJAdnHslH2Y0YtrmCnLT1jUZNvZnZ4io1R2RVariPJXqPD+0sCEzEFBWRVbYKCfAsAKWaUQ87FfigIqxp4tSZ718BpEQTBZvW4dUImPGg49Fdki8eShNL1n3i/rS97j+OxRqfTNnUNpRmfgAorNdMH+MmGB8Gy+hTA==
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by AM0PR03MB4737.eurprd03.prod.outlook.com (2603:10a6:208:cb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 09:37:37 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21%6]) with mapi id 15.20.5395.020; Thu, 7 Jul 2022
 09:37:37 +0000
To: Marc Zyngier <maz@kernel.org>, Oleksandr <olekstysh@gmail.com>
Subject: Re: [PATCH v3 6/8] genirq: Add and use an irq_data_update_affinity
 helper
Thread-Topic: [PATCH v3 6/8] genirq: Add and use an irq_data_update_affinity
 helper
Thread-Index: AQHYjYVqhNJG+4sRYkWyXsKH5qhjxa1sxkCAgAXY/ACAABASgA==
Date: Thu, 7 Jul 2022 09:37:37 +0000
Message-ID: <4adea4b3-8e42-ef94-b29f-f375d167d55e@epam.com>
References: <20220701200056.46555-1-samuel@sholland.org>
 <20220701200056.46555-7-samuel@sholland.org>
 <c7171195-796a-e61e-f270-864985adc5c3@gmail.com>
 <87bku1mi3l.wl-maz@kernel.org>
In-Reply-To: <87bku1mi3l.wl-maz@kernel.org>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08768308-e26f-4792-3532-08da5ffc5455
x-ms-traffictypediagnostic: AM0PR03MB4737:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1NVapwnjiW95BqQ7BoYPG6olQ4Bxy2HMcBhMalP14KVYpJijm5gEMc6/d4hoJnxQvpZxJHDPGZj60oqFrquf7yeMJXKNwTIZJgBoufSFIoOApzcI3qMtG8KufLQufGdoch9dzQaXxED/ga7v3S9ueOevm91WSIi0loqt7hyrbUr+JPYu8+2NU1YNIhghz7n6Ge+GiyvExtIVTAayJ2dqoqSpcRcp1rvr+FBYyeG1GZFTFyLFD3dvopMlxonNzCMkaWVVIuuJ1H6qcCzb5pyuwKb1lbMpIz6aXRgYljy6KY2uPKIIZTdKjLJIPsKe7c6xpCxprDYSMIXdqxX9AEJ6svymuXrzE5ZEG3/vtC6jup3DCivLU1AfL4LettBCyAba+bQDPmOucvs25JFxQ5h383d1Xx5C4sNouPCd5cELNiHNLLUofJ5ncoErc4Dw/nH7GFT/WaUKKHt1+VW6tsV+4nF4CPy3Uits/egQEeEPSlxCGk3cEUp7go1ZLXAEO2KTKmIrmXMDeyXP2P59aqHkUGBFvL735WtRF5ugeO+eTVRIYl1moewLTTkWYHbcQtXpxmI3J55sL32MvARVkt+zlKrCpNYQ2ogoQhZW5jEXgbhv4cW11iJ7yDUibT+YaLbOE1PKs7tdJCiQkWc3HRre9xSfpn44mkSpNfXPnNddBtzgaPqIHJSelJsRkcYCKzuqNNGJ4NzLIfFl8DNzZ5LbwjwtsDdbUr6Hh3xvV/JzrJEndHnM41E8nVBmKyVh4ccV3xzYwmhnLhw6ROWhuagHr5Iuj+1Zfc2IyCawwUbVRpeBuhJIEFthwwCEhzkgrr9gqZbqf3bJGc4qUnjim2sRD4mgUGrHfT96bqdO59kafxE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR03MB6108.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(53546011)(4326008)(6506007)(55236004)(316002)(8676002)(91956017)(2906002)(64756008)(8936002)(86362001)(66556008)(66446008)(26005)(83380400001)(478600001)(6512007)(66946007)(76116006)(31686004)(7366002)(31696002)(38100700002)(38070700005)(66476007)(7406005)(5660300002)(7416002)(186003)(71200400001)(41300700001)(6486002)(36756003)(122000001)(2616005)(54906003)(110136005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elYrZ05YWWQvd0J5T2s1dHRiU3JqY05ZUUljd0J6eCtSMDVqTGV3Y3dEWXQv?=
 =?utf-8?B?MXk4TXFnZnpjeFNtNWUybmdtOGhhTnRqOGZhQ29VNGdkcjBzNmZGcjdnSVJo?=
 =?utf-8?B?TVFJM1RWdlQ1MmlYZGQ1a21Za1ZUT2JQQ3dOWWJNNVBSL0hxdUZpT0hRRHAx?=
 =?utf-8?B?OXZFNlVXU2xqK1VrVktKN1ljK1RjQ1RSNVg1Ty8zRXhtS3VVaEpYVUM4c3Rh?=
 =?utf-8?B?SFpYVldjME1DZDNZMEw5NExwMVVEeFdiZHVubnRrZVdCQzJPTXlOcDhKQ2p5?=
 =?utf-8?B?T1UxM1Q1UVpQZ0JzRngwVEpjTklKOU1TbTF1ZDZFQVBTTzNJTWJhVmJuSXd1?=
 =?utf-8?B?ZU5YdUtBNmJEa0xDYWdkUDM5SnFIempCTnlNRXBTWDEwMytKK3JSeVVxbUJH?=
 =?utf-8?B?MzhtL2tzL0lIMWRtZWNUN0puYWxuVHptdmlUMDlGWFZrWkkrMUhvVGt0RjRH?=
 =?utf-8?B?MTF0ZVBDRmN6dTFsS2dCL1RpNFRYbDZzdmgyTDdZQmVCVkZMSmdocDVYMjJJ?=
 =?utf-8?B?ZXAwVGoyc3JNd2dWMEFFVVEwYUNYeVRwTkc0bE15RmE2dEU3cFQvK1dxeVJ3?=
 =?utf-8?B?NW9lRlFzVnFzalMrOHFSY1VBTnFkbFY3VkZXajNVWmhVNWNya28wbXVUQ3pz?=
 =?utf-8?B?YldPM2M4NStKUUVIUFdtU09Od0IzQWc3QnNIZkFabUNpNE5nb3UwTU0rQVJ3?=
 =?utf-8?B?OFpWeHMweGpWeFRYM1lxaTF3K2RFNCsvZ2gxd1lSNW9jeXBNRFJ5V2RoRFRw?=
 =?utf-8?B?ekY4aTBVWnFCYjNocVNmRlBOT3lJdWJnTEcxMWc0Y0lMbjZXbGg5S0kzT1Vp?=
 =?utf-8?B?UVRSR0tZNFBLc3pqWEZaSk1qMDlUNnZZQUk2T1NoMUQzMXVYbzNIczFMSmpn?=
 =?utf-8?B?WmxvRWhWQVZtVWNTVTBKQzNkczY3VDVYdFNzTU9ZWEVSczhTK0ExQTd3RldX?=
 =?utf-8?B?eWJCRlV1U3Q5NXUxNWR6NHhzYzRGcXRtdUFybjk4TWlITWlmKzVNUndwT0wz?=
 =?utf-8?B?dkc4QWlUUUQzOWJKUVM3UXRsSzNUMnZhdmEwMlM3YWpqMjc2dzJBOWwwZXFX?=
 =?utf-8?B?M3FTUGU2SzVnZ3ZrQklZWXhnYnVmaGZXV1g1aG5SRVNldVBiYXowcjBjV1Jm?=
 =?utf-8?B?SnRtNEtZYUl2S2cxMm4yQWZ3VGFvZTc4NzgweXNtTHFYV3hNaEVLb0NtdXZm?=
 =?utf-8?B?MVFmY3NDczJ1d1p2UEt6VW5VTHM2K0daNFRlSitmbm1MaVdZQ1p1c2pGcTRX?=
 =?utf-8?B?L25iRkN0eHdyamYyYWdsMHN0Z1ZlRVBVTlZ5NEwrMTBEdVRtbTRpdFd3bG4w?=
 =?utf-8?B?SWM4U3liM0c4amRFSzgrTk5NeVhXNUNqcTZiZFphTlNNYzlUaUNNVnhxQVM0?=
 =?utf-8?B?cWoyUzFaeTN3dmRwbXdOMkdqSDBBRTNlZjdxWDR5aGUwcGZhUEUxYW50VW5h?=
 =?utf-8?B?RE9qYTdFaTJOU1FaZUovNFQ5SXBOTklYSWdoU1RPTHlxMUswYlhGeUc0Z09C?=
 =?utf-8?B?Y05WaDUwQVJTRjhMRTlkSXc5Z0VOTGRPTnQ2aG1xSnJDV0VYV0N5L2lDUEVM?=
 =?utf-8?B?d3c1b0NMaDJSRHQ3NjFzV0U2eGdScEtNeFlRUXc1VngvV09jY2pDOS94akZV?=
 =?utf-8?B?YTdyd0NZZ2xYd1dYZUlBdXNUTEhWcW1vdGlTdEl2Um5xOXkybHRIWkg3a3BL?=
 =?utf-8?B?VGhjNkJjVDBONHBSTk55cVlKT1Q1UWgrNVM2M2Evd3dQZWVndURFaEwwRDdG?=
 =?utf-8?B?aWRjNUVmYTRhTklCVU1vUmdtNVB0dURZZU1WN2g1NVhta2V0djV5VW95MEJB?=
 =?utf-8?B?S3RxQVpMNWMyMVFzTE9QNzVuSWtoNVpXV0t5YThmbzN2MnVXYkpZNk5tMDhy?=
 =?utf-8?B?ZndSMFlhZ096M253bUZkSFMyY0FkdzZVeTdWdDI0UHVsS2NRK2k5bENkbmhu?=
 =?utf-8?B?Vi9zOVdXVUZoMzVVckhFa2NQck1iK2g4RXlkSW1ndGJna25nTEVhSjY0Qk9E?=
 =?utf-8?B?SDJPcWEwU1ZteGJOcm82Q0JWR0VTeWU0R28zVGhWczJhcGdYYkhpOUFVcmZP?=
 =?utf-8?B?ZkszUmJ0WkxyL2hodFcyQlNTazMzZjNtcHc2RStidlVZODZyY1V0QXdjTnNU?=
 =?utf-8?B?UlUyUUtab3UydnJNV2d6OTZsWGJBSm4vZGtIZ0lCREMzdHA0TlhoTWlodkN4?=
 =?utf-8?Q?lsTpCOUfieyZwoafjdWvTG4=3D?=
Content-ID: <1A2A6F3382BD034AA584D1B6BDD9A136@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08768308-e26f-4792-3532-08da5ffc5455
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 09:37:37.7457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ryFqHslH8IpUz7b72RFfJvy4p1fW4q/x1ifnCR0X/7sOMjcumuUQn0fbg0IylHbthA6LFj9RR9LO/kflZiTFCn5LTqKCdQ5CGNoydWaZoLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4737
X-Proofpoint-GUID: lIES_1e9YhpkrSQcZ5YNMjaxWVftG38H
X-Proofpoint-ORIG-GUID: lIES_1e9YhpkrSQcZ5YNMjaxWVftG38H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_06,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 impostorscore=0 mlxscore=0 phishscore=0 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207070037
Cc: Mark Rutland <mark.rutland@arm.com>,
 =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?= <kw@linux.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jan Beulich <jbeulich@suse.com>, "H.
 Peter Anvin" <hpa@zytor.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Sven Schnelle <svens@stackframe.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Rob Herring <robh@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Samuel Holland <samuel@sholland.org>, Will Deacon <will@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, "x86@kernel.org" <x86@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>,
 Wei Xu <xuwei5@hisilicon.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Ingo Molnar <mingo@redhat.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Matt Turner <mattst88@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 Kees Cook <keescook@chromium.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Maximilian Heyne <mheyne@amazon.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>, Julia Lawall <Julia.Lawall@inria.fr>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>, Colin Ian King <colin.king@intel.com>,
 Helge Deller <deller@gmx.de>
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
From: Oleksandr Tyshchenko via iommu <iommu@lists.linux-foundation.org>
Reply-To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


On 07.07.22 11:39, Marc Zyngier wrote:


Hello Marc

> On Sun, 03 Jul 2022 16:22:03 +0100,
> Oleksandr <olekstysh@gmail.com> wrote:
>>
>> On 01.07.22 23:00, Samuel Holland wrote:
>>
>>
>> Hello Samuel
>>
>>> Some architectures and irqchip drivers modify the cpumask returned by
>>> irq_data_get_affinity_mask, usually by copying in to it. This is
>>> problematic for uniprocessor configurations, where the affinity mask
>>> should be constant, as it is known at compile time.
>>>
>>> Add and use a setter for the affinity mask, following the pattern of
>>> irq_data_update_effective_affinity. This allows the getter function to
>>> return a const cpumask pointer.
>>>
>>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>>> ---
>>>
>>> Changes in v3:
>>>    - New patch to introduce irq_data_update_affinity
>>>
>>>    arch/alpha/kernel/irq.c          | 2 +-
>>>    arch/ia64/kernel/iosapic.c       | 2 +-
>>>    arch/ia64/kernel/irq.c           | 4 ++--
>>>    arch/ia64/kernel/msi_ia64.c      | 4 ++--
>>>    arch/parisc/kernel/irq.c         | 2 +-
>>>    drivers/irqchip/irq-bcm6345-l1.c | 4 ++--
>>>    drivers/parisc/iosapic.c         | 2 +-
>>>    drivers/sh/intc/chip.c           | 2 +-
>>>    drivers/xen/events/events_base.c | 7 ++++---
>>>    include/linux/irq.h              | 6 ++++++
>>>    10 files changed, 21 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/arch/alpha/kernel/irq.c b/arch/alpha/kernel/irq.c
>>> index f6d2946edbd2..15f2effd6baf 100644
>>> --- a/arch/alpha/kernel/irq.c
>>> +++ b/arch/alpha/kernel/irq.c
>>> @@ -60,7 +60,7 @@ int irq_select_affinity(unsigned int irq)
>>>    		cpu = (cpu < (NR_CPUS-1) ? cpu + 1 : 0);
>>>    	last_cpu = cpu;
>>>    -	cpumask_copy(irq_data_get_affinity_mask(data),
>>> cpumask_of(cpu));
>>> +	irq_data_update_affinity(data, cpumask_of(cpu));
>>>    	chip->irq_set_affinity(data, cpumask_of(cpu), false);
>>>    	return 0;
>>>    }
>>> diff --git a/arch/ia64/kernel/iosapic.c b/arch/ia64/kernel/iosapic.c
>>> index 35adcf89035a..99300850abc1 100644
>>> --- a/arch/ia64/kernel/iosapic.c
>>> +++ b/arch/ia64/kernel/iosapic.c
>>> @@ -834,7 +834,7 @@ iosapic_unregister_intr (unsigned int gsi)
>>>    	if (iosapic_intr_info[irq].count == 0) {
>>>    #ifdef CONFIG_SMP
>>>    		/* Clear affinity */
>>> -		cpumask_setall(irq_get_affinity_mask(irq));
>>> +		irq_data_update_affinity(irq_get_irq_data(irq), cpu_all_mask);
>>>    #endif
>>>    		/* Clear the interrupt information */
>>>    		iosapic_intr_info[irq].dest = 0;
>>> diff --git a/arch/ia64/kernel/irq.c b/arch/ia64/kernel/irq.c
>>> index ecef17c7c35b..275b9ea58c64 100644
>>> --- a/arch/ia64/kernel/irq.c
>>> +++ b/arch/ia64/kernel/irq.c
>>> @@ -57,8 +57,8 @@ static char irq_redir [NR_IRQS]; // = { [0 ... NR_IRQS-1] = 1 };
>>>    void set_irq_affinity_info (unsigned int irq, int hwid, int redir)
>>>    {
>>>    	if (irq < NR_IRQS) {
>>> -		cpumask_copy(irq_get_affinity_mask(irq),
>>> -			     cpumask_of(cpu_logical_id(hwid)));
>>> +		irq_data_update_affinity(irq_get_irq_data(irq),
>>> +					 cpumask_of(cpu_logical_id(hwid)));
>>>    		irq_redir[irq] = (char) (redir & 0xff);
>>>    	}
>>>    }
>>> diff --git a/arch/ia64/kernel/msi_ia64.c b/arch/ia64/kernel/msi_ia64.c
>>> index df5c28f252e3..025e5133c860 100644
>>> --- a/arch/ia64/kernel/msi_ia64.c
>>> +++ b/arch/ia64/kernel/msi_ia64.c
>>> @@ -37,7 +37,7 @@ static int ia64_set_msi_irq_affinity(struct irq_data *idata,
>>>    	msg.data = data;
>>>      	pci_write_msi_msg(irq, &msg);
>>> -	cpumask_copy(irq_data_get_affinity_mask(idata), cpumask_of(cpu));
>>> +	irq_data_update_affinity(idata, cpumask_of(cpu));
>>>      	return 0;
>>>    }
>>> @@ -132,7 +132,7 @@ static int dmar_msi_set_affinity(struct irq_data *data,
>>>    	msg.address_lo |= MSI_ADDR_DEST_ID_CPU(cpu_physical_id(cpu));
>>>      	dmar_msi_write(irq, &msg);
>>> -	cpumask_copy(irq_data_get_affinity_mask(data), mask);
>>> +	irq_data_update_affinity(data, mask);
>>>      	return 0;
>>>    }
>>> diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
>>> index 0fe2d79fb123..5ebb1771b4ab 100644
>>> --- a/arch/parisc/kernel/irq.c
>>> +++ b/arch/parisc/kernel/irq.c
>>> @@ -315,7 +315,7 @@ unsigned long txn_affinity_addr(unsigned int irq, int cpu)
>>>    {
>>>    #ifdef CONFIG_SMP
>>>    	struct irq_data *d = irq_get_irq_data(irq);
>>> -	cpumask_copy(irq_data_get_affinity_mask(d), cpumask_of(cpu));
>>> +	irq_data_update_affinity(d, cpumask_of(cpu));
>>>    #endif
>>>      	return per_cpu(cpu_data, cpu).txn_addr;
>>> diff --git a/drivers/irqchip/irq-bcm6345-l1.c b/drivers/irqchip/irq-bcm6345-l1.c
>>> index 142a7431745f..6899e37810a8 100644
>>> --- a/drivers/irqchip/irq-bcm6345-l1.c
>>> +++ b/drivers/irqchip/irq-bcm6345-l1.c
>>> @@ -216,11 +216,11 @@ static int bcm6345_l1_set_affinity(struct irq_data *d,
>>>    		enabled = intc->cpus[old_cpu]->enable_cache[word] & mask;
>>>    		if (enabled)
>>>    			__bcm6345_l1_mask(d);
>>> -		cpumask_copy(irq_data_get_affinity_mask(d), dest);
>>> +		irq_data_update_affinity(d, dest);
>>>    		if (enabled)
>>>    			__bcm6345_l1_unmask(d);
>>>    	} else {
>>> -		cpumask_copy(irq_data_get_affinity_mask(d), dest);
>>> +		irq_data_update_affinity(d, dest);
>>>    	}
>>>    	raw_spin_unlock_irqrestore(&intc->lock, flags);
>>>    diff --git a/drivers/parisc/iosapic.c b/drivers/parisc/iosapic.c
>>> index 8a3b0c3a1e92..3a8c98615634 100644
>>> --- a/drivers/parisc/iosapic.c
>>> +++ b/drivers/parisc/iosapic.c
>>> @@ -677,7 +677,7 @@ static int iosapic_set_affinity_irq(struct irq_data *d,
>>>    	if (dest_cpu < 0)
>>>    		return -1;
>>>    -	cpumask_copy(irq_data_get_affinity_mask(d),
>>> cpumask_of(dest_cpu));
>>> +	irq_data_update_affinity(d, cpumask_of(dest_cpu));
>>>    	vi->txn_addr = txn_affinity_addr(d->irq, dest_cpu);
>>>      	spin_lock_irqsave(&iosapic_lock, flags);
>>> diff --git a/drivers/sh/intc/chip.c b/drivers/sh/intc/chip.c
>>> index 358df7510186..828d81e02b37 100644
>>> --- a/drivers/sh/intc/chip.c
>>> +++ b/drivers/sh/intc/chip.c
>>> @@ -72,7 +72,7 @@ static int intc_set_affinity(struct irq_data *data,
>>>    	if (!cpumask_intersects(cpumask, cpu_online_mask))
>>>    		return -1;
>>>    -	cpumask_copy(irq_data_get_affinity_mask(data), cpumask);
>>> +	irq_data_update_affinity(data, cpumask);
>>>      	return IRQ_SET_MASK_OK_NOCOPY;
>>>    }
>>> diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
>>> index 46d9295d9a6e..5e8321f43cbd 100644
>>> --- a/drivers/xen/events/events_base.c
>>> +++ b/drivers/xen/events/events_base.c
>>> @@ -528,9 +528,10 @@ static void bind_evtchn_to_cpu(evtchn_port_t evtchn, unsigned int cpu,
>>>    	BUG_ON(irq == -1);
>>>      	if (IS_ENABLED(CONFIG_SMP) && force_affinity) {
>>> -		cpumask_copy(irq_get_affinity_mask(irq), cpumask_of(cpu));
>>> -		cpumask_copy(irq_get_effective_affinity_mask(irq),
>>> -			     cpumask_of(cpu));
>>> +		struct irq_data *data = irq_get_irq_data(irq);
>>> +
>>> +		irq_data_update_affinity(data, cpumask_of(cpu));
>>> +		irq_data_update_effective_affinity(data, cpumask_of(cpu));
>>>    	}
>>
>>
>> Nit: commit description says about reusing irq_data_update_affinity()
>> only, but here we also reuse irq_data_update_effective_affinity(), so
>> I would mention that in the description.
>>
>> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com> # Xen bits
> b4 shouts because of your email address:
>
> NOTE: some trailers ignored due to from/email mismatches:
>      ! Trailer: Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com> # Xen bits
>       Msg From: Oleksandr <olekstysh@gmail.com>

sorry for the inconvenience


>
> I've used the tag anyway,


thank you


>   but you may want to fix your setup in the
> future.

yes, will do


>
> Thanks,
>
> 	M.
>
-- 
Regards,

Oleksandr Tyshchenko
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
