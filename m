Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 391F04FF967
	for <lists.iommu@lfdr.de>; Wed, 13 Apr 2022 16:49:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB7F4408CC;
	Wed, 13 Apr 2022 14:49:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ujKauY2U3t1m; Wed, 13 Apr 2022 14:49:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A465640918;
	Wed, 13 Apr 2022 14:49:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7053FC0088;
	Wed, 13 Apr 2022 14:49:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DB33C002C
 for <iommu@lists.linux-foundation.org>; Wed, 13 Apr 2022 14:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06F1160C2C
 for <iommu@lists.linux-foundation.org>; Wed, 13 Apr 2022 14:49:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4RH95GvHrZrC for <iommu@lists.linux-foundation.org>;
 Wed, 13 Apr 2022 14:49:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F0096058F
 for <iommu@lists.linux-foundation.org>; Wed, 13 Apr 2022 14:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649861378; x=1681397378;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5tUWvY5wx83qgPWDLMYmB95ltyTG/n0uPhWh1X+W59w=;
 b=SJWClYTJGhVrdCoD8l/AbdGa//M5i0VVl4EXbhZqc14s0eEXWjfilF8F
 A+Wlga0vYW+pMYQT+oCgEYUWPUtsRbwrropV7Fx6nqbOnEakTwYBqdEOR
 +cxRme6swRjyXaatbVCs9Rn8vvu1hY4KBizMUbH0Em3YsTbMqxG0QJAcA
 8rMJhagWbkdd5Ct+d0n4YIfw5YzmgrOjo0e8SCDmgjwAP46fbz/LcLHaq
 5frfxv0RUtuzUrAaLvuSB8grhLWCSmSGBxvJOd03E3l3XCaQG3aHGz6jn
 wgk2ALMgvuy10hr2x5UC8JA9PVW+4Z34QlWT134UGQ/OW8qZNooqpKPFT Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="260284557"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="260284557"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 07:49:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="700275904"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga001.fm.intel.com with ESMTP; 13 Apr 2022 07:49:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Apr 2022 07:49:30 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Apr 2022 07:49:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Apr 2022 07:49:29 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Apr 2022 07:49:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVUMsZiJioFgf5ry1qYIri7XePyxYxXEEcjwegaf+HLtXtn+5Q/r+DOkx41qhzlmaO1Kx5eDtG4yROZ8zTZM7cYtQphGHGGA9hjp/F4bQsD5lGikadCzNdifa2jggv04vSo/UlwY1a/0KGRv7eo1Yee+BV4tBImkCok42xoUnZLgScZMe64BGqo1AmTCQpqEb5f5yp3zWfaYknqizNQnPkrlFAewsta0gGt9lPhBkZngop/Arol1YulRiC0RbbUsJYLY6/XQ/yJOG2a/R+cbruw4K+vtTxk3PRwpYLFEl/L6LPWfbeB4H0sF91n8MN7NcHWLWAPq8u8zKsPDIsnScg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dd5MpaWmLvYY91EVW6AfhLRft6j26Izcz/3wk7aKaoM=;
 b=VO+mphBvyVzxlIIdetECK19Y9iojqVPebeyk2bypF1DL/aFSrsYtS0toy4v9kgASdvCBOqMmn5xbHqrKcY4uMj/AwtHqcQaZ6CpTmwJIG+TA7rcrwlsGQm67gQ0P+nKOqHMeVOBi9jSqajnuVXehCO8y1xQ+Tnl69L9x4wsBpflfZRX45NrVAArvIerz0UDCoOvW9kdiIgBxmFIkDJJE7u5pN0hxYoforilNjbKmW2W5YD3VpONRu3U7e8IWxKP+U1OBgnEmLjUOUD3YejTWxd88hVBYYwcN5IwOTWH95jkL+F0EzJH44QwXeBdq761R/nVagzf8J/8+UnhpLtPGaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4095.namprd11.prod.outlook.com (2603:10b6:208:150::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 14:49:26 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::71d2:84f6:64e1:4024]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::71d2:84f6:64e1:4024%6]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 14:49:26 +0000
Message-ID: <42f6e2ac-8abf-8275-01fd-9b0c5dd53b4a@intel.com>
Date: Wed, 13 Apr 2022 22:49:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH RFC 07/12] iommufd: Data structure to provide IOVA to PFN
 mapping
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <7-v1-e79cd8d168e8+6-iommufd_jgg@nvidia.com>
 <17c0e7f2-77ee-0837-4d81-ee6254455ab7@intel.com>
 <20220413143646.GQ2120790@nvidia.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <20220413143646.GQ2120790@nvidia.com>
X-ClientProxiedBy: HK2PR03CA0062.apcprd03.prod.outlook.com
 (2603:1096:202:17::32) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d0cd454-da53-4223-ce00-08da1d5cce07
X-MS-TrafficTypeDiagnostic: MN2PR11MB4095:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MN2PR11MB4095B1FA82D73A6AE520AE9CC3EC9@MN2PR11MB4095.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J+VYKXDS3g3M97sYV93u5cIirvX+bdQrniEswMHi9sbJuL/EwR9xQelu/YiCH0SRG4OsJ4hmYuS2p72DyW1dOejDSeJyRGhXJddJpQvR1ScJoEH8r8t6CP3Q1tIqn9/+QgvfH/ibIUdGAtktbF+1pujte2A3xhK1yQphSrRDTHT+n18Pa/gbe33H6QAC9NkoYM6CV6HZU185FFBd3KhDrr2U1zkVYeceWdpx9rkP63diy3hIGup/vqzEit+TkICuTmNbUqTnw5gjPezNVWzFRLRmBrKVvP21x6sXgoeA1+dfDLUihevkihh6vorKFZj/JzhQSbjvoryiHBgA68xQL+ghcVGHJD3ndT5wJ0XqQc2u3mVoNy1tzt8aVe9dLN9o6emK0hhqwpg2/4G88B9dK+27OS9rT3/ACNfr4LHfHsT/gyTBv8p+M1ggrsippSTflqfdiUsO+uyqFJyHvQWA7AUNzz3Bp3i3Rc2SMHuJnoV6sXEelxNfYre8pXm/NHQdurY8JUnfWHPdXptA2sVkigKyNlAHEnG2StOS+FnDdcrf/yGSeDC2VAraHPHT1x+PeULfqfqxVB0M1XDCFl8T0OJjfT0spKaKI7R7CUPrib2izLJexbStpFBSAwo/GSegAG5f5eMxXq2hoXxmFm9PX0h9IOYgfc+eZvZtdlGnFYASz2O7ZYpqlupR8qLN1farHmKTskHIu8H1e68BWU74ajqRnZl5gNfHrwz3bh3MbCcRdo+80j3WgUBoq8o6LqeC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5658.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(2906002)(7416002)(8676002)(5660300002)(86362001)(26005)(53546011)(38100700002)(316002)(8936002)(83380400001)(6666004)(66946007)(31696002)(6512007)(4326008)(6506007)(66556008)(66476007)(82960400001)(186003)(54906003)(6916009)(6486002)(508600001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXQ1cjhPbmNydlgzeEw3SDhJbjFNaEltWWlzNFRtZ0ttYnhxakNBN2o2dkVV?=
 =?utf-8?B?ZllMeGRYeDRhMFBKRWRmUjFIanFxcEI5dEh1RGFuOU1tb0NHTjZSektTdzJS?=
 =?utf-8?B?Y2FkTWJvemJhL0c0aU1lWHBScmVnMDlwczFycWhKSHBhNng0U3VoTStJa3Jy?=
 =?utf-8?B?MGNZZGU1YjZjdFNVOWZYMU93ME1mQ1A0S2t4YkRwRm5UOHRBeWtlZmdkSUZP?=
 =?utf-8?B?T01CZVlzWVpRVTYwWTlGc1hFbjlsMnVGTXdSMEE5Uk1OWlpYaTY2Tkh5aFQ4?=
 =?utf-8?B?QXFUUHV5N3oxZ0pSRyt1Z09SWGpjek5BTHlMMzNXOXNvTk95aVNkNFlkSnh4?=
 =?utf-8?B?RmJ3d05NRER4Qm4ySnNTMGxrdkk1bzZPRy9vVFpyQ2ljMDZEeEMwY3YzekF0?=
 =?utf-8?B?M2M5Q2hPMmtUdGRHZWRmRkpQOEtQWjZDUEs0djE4dXlGUWdpM1ZITlIvaEEx?=
 =?utf-8?B?QnpYYXZaM3U4M3h0dFBvUzE0ZExRUXlTYWZLM3RwTmJkdU5TalNlNXdRcldk?=
 =?utf-8?B?M1NBN0tocFpBL3dlNGMzSXJXUkgwdnk2bXFBTTFhVUtIbWlWVWt4bmxaRStP?=
 =?utf-8?B?SnBJN3lXSHJuS3BsWU80eTFzWkk0eURNd2lJVmZpOGt4SVZTNjQ1SE5pajU0?=
 =?utf-8?B?NVRjOGduSm9hdHFpamtocUZvUGRBbGtWeStNam8zU2wzYUY3bUYvUmY2NEJB?=
 =?utf-8?B?T1dxRTNhTVJrM0lvcUNGQUdTREhJSlhQVlR4cDVLVjNzSVd6dXZqakhPVjhh?=
 =?utf-8?B?L0o1NTVLZ2RjQm5PSkdhUXhHTW1ISlVxWDcwNWZsSnFaVzE0Sk53TnBOUG1q?=
 =?utf-8?B?Ym5BMlJrVEtMK1VEeFlSVS9ZSmt5TVVydWlHcXk2WW0wdE0vNm1VQ3I4blgz?=
 =?utf-8?B?UDJXRTM0cHBHZ21jWHRqUmxkd3NrTUt6SDJrclB5RHE0RXpqQWF2YU95VEha?=
 =?utf-8?B?U3YvL1YrYzNIS3NmY3ZFd05MOTFjTFR4eHpkMmlaUlZMUFU0ZnU4T2hORFcx?=
 =?utf-8?B?MTR1OHg2RDJnQnB5OW9wR1UxT3h6NlRLOXJsWmtEeFdxM2x1eEV0OTZTVEhu?=
 =?utf-8?B?dUl0a3M5ZkhjRURvY2hvSXRlYVJvWEJKY2hkemg5MkZXem1jNEdtbi9HelJq?=
 =?utf-8?B?R2d4MXpnQVdGNFRCMFlNTDhrTi9VSDZORGp1UXJwTmpmMWJpdHhtQVZZRk9j?=
 =?utf-8?B?SkJ5VStFZi9SUjFRL2tZOTRXRzN1NXEwWW53a3c3alNqNkVHWUpMRTd6VEVD?=
 =?utf-8?B?VFZyTU9LTkM1VjdIR2ZGeDBCTVpCMm8vMkpBUlNNR2FBYjlBZ3kyaVJ3RG9Y?=
 =?utf-8?B?b1RpOU9DZ21JcEkvRTlSOHAzNmNhU2g4eitNSFh3Z000Nkx0Y1Y5VkcvV1FD?=
 =?utf-8?B?aHlRZ3NxZVdkc2V2Uk5KRjhtUVRrM0lpUTZZMDFoazVOYVg5WEZMUnV1K3U3?=
 =?utf-8?B?aGR6aUprcEhPVEFvdVVDWEN3UFptcEdsVm8vS2ZhU3E2dWxKSEJXS09aUFJS?=
 =?utf-8?B?T3VaR2lhZ3ltcHdqSmtvRE5GOXB5QXJaaUordms2b08zWXJleHFXaFpoZlRW?=
 =?utf-8?B?dHlsWDA0Uzl6bHR4MDJmMGlwcDhmRW1ja3hTdHdkcms5ZHQwb0tJTlJHSElT?=
 =?utf-8?B?QjMzWTZJWWVtck1lOTBJNkNGbEJzcTZxY3Y3RWxBL2hQV2syb09IWlFEZmNx?=
 =?utf-8?B?TEVDZTFPUGJRK3YxaE80UTNMZFp3bVJZazk2c294Mys5dGtVUUxqOEViQzhR?=
 =?utf-8?B?ZUl5dFBSQW9yNEdTaWx4VGRLelNxUDZXcFNxMkpjZmdHSEFxY2duME0yT2Y1?=
 =?utf-8?B?L2Era1I2cDh1VmtSUEt6cmJqY09xdjJnenAxNmNPMVF2WklYTXB3cjdKV1hB?=
 =?utf-8?B?REJvT1YzN2piU2ZWU2F5am1wUFFXUUhkTmZkWi9oc0lZUmloTTh5dWptSWNC?=
 =?utf-8?B?OEpYOGszTk94bnpwcjZVT00zSE9iK0pmVXRvaVFPWDhUaVovTkRiNUpnRVVP?=
 =?utf-8?B?NktyWmNxb1JVUjFTcGtPQzBvWjViYWhvVlN5WWFFSTIrOVFOTVUyZVMyNWQv?=
 =?utf-8?B?VXFJempYQ2FXWGdEOXBvTE5PRVJpeXhnTFM1Si9NZW1VajJTSTdkWjg4MWRX?=
 =?utf-8?B?UFB6UnpZbmZBTkIyR1V1M3hSQmpOdTM0bGhPbUx0L29FNlNQbzhKM1JSSkYz?=
 =?utf-8?B?MnhDMHUrOFU3cVZWWjB0SW1yMytSelhmSjczRDRITDRFL2Y4ajFDaGR4dG1C?=
 =?utf-8?B?WERBVlVlK2J1ZGhYR3FncDhqQS90VVpzbm43dHlJR2MxWkZmdzhoWHUzL0I3?=
 =?utf-8?B?clBRRHpaWjdKY1pBaFNiSDN6U1hiMGNkbXc1UHgwcEk3cEwvaUdUeE1OVTBt?=
 =?utf-8?Q?ZaNqQHjuyrKvPAVA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0cd454-da53-4223-ce00-08da1d5cce07
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 14:49:26.0285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FdtbW3QF0fUH5BsYgBdqmxFjvQcE9fQ6TeWQ0SWGrZYo6rICgnW+N2psi/NLrUX6T6gebLYt3aTb8+mGC23Chg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4095
X-OriginatorOrg: intel.com
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Chaitanya Kulkarni <chaitanyak@nvidia.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Niklas Schnelle <schnelle@linux.ibm.com>,
 iommu@lists.linux-foundation.org, Daniel Jordan <daniel.m.jordan@oracle.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 David Gibson <david@gibson.dropbear.id.au>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2022/4/13 22:36, Jason Gunthorpe wrote:
> On Wed, Apr 13, 2022 at 10:02:58PM +0800, Yi Liu wrote:
>>> +/**
>>> + * iopt_unmap_iova() - Remove a range of iova
>>> + * @iopt: io_pagetable to act on
>>> + * @iova: Starting iova to unmap
>>> + * @length: Number of bytes to unmap
>>> + *
>>> + * The requested range must exactly match an existing range.
>>> + * Splitting/truncating IOVA mappings is not allowed.
>>> + */
>>> +int iopt_unmap_iova(struct io_pagetable *iopt, unsigned long iova,
>>> +		    unsigned long length)
>>> +{
>>> +	struct iopt_pages *pages;
>>> +	struct iopt_area *area;
>>> +	unsigned long iova_end;
>>> +	int rc;
>>> +
>>> +	if (!length)
>>> +		return -EINVAL;
>>> +
>>> +	if (check_add_overflow(iova, length - 1, &iova_end))
>>> +		return -EOVERFLOW;
>>> +
>>> +	down_read(&iopt->domains_rwsem);
>>> +	down_write(&iopt->iova_rwsem);
>>> +	area = iopt_find_exact_area(iopt, iova, iova_end);
>>
>> when testing vIOMMU with Qemu using iommufd, I hit a problem as log #3
>> shows. Qemu failed when trying to do map due to an IOVA still in use.
>> After debugging, the 0xfffff000 IOVA is mapped but not unmapped. But per log
>> #2, Qemu has issued unmap with a larger range (0xff000000 -
>> 0x100000000) which includes the 0xfffff000. But iopt_find_exact_area()
>> doesn't find any area. So 0xfffff000 is not unmapped. Is this correct? Same
>> test passed with vfio iommu type1 driver. any idea?
> 
> There are a couple of good reasons why the iopt_unmap_iova() should
> proccess any contiguous range of fully contained areas, so I would
> consider this something worth fixing. can you send a small patch and
> test case and I'll fold it in?

sure. just spotted it, so haven't got fix patch yet. I may work on
it tomorrow.

-- 
Regards,
Yi Liu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
