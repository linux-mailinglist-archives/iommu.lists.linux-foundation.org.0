Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F9A51D2EB
	for <lists.iommu@lfdr.de>; Fri,  6 May 2022 10:12:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CF8660BBD;
	Fri,  6 May 2022 08:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cff3zZvSr8x2; Fri,  6 May 2022 08:12:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4B99160B5B;
	Fri,  6 May 2022 08:12:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C275C002D;
	Fri,  6 May 2022 08:12:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93570C002D
 for <iommu@lists.linux-foundation.org>; Fri,  6 May 2022 08:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7ACE582E5F
 for <iommu@lists.linux-foundation.org>; Fri,  6 May 2022 08:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b4lC4iXQm9Q6 for <iommu@lists.linux-foundation.org>;
 Fri,  6 May 2022 08:12:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4388982D96
 for <iommu@lists.linux-foundation.org>; Fri,  6 May 2022 08:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651824736; x=1683360736;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zHvBgKFjqTCHzJieMWc2evBOyWdG6TfZSH2LFL0LhsI=;
 b=CBOQFIYQ20myOtAATPcKYixzZ1mnavy0L+3DfYWOb7xNsbNZThNFrm9r
 i7c0ryD00t+338Fsr85C8KvedXMFoY2u0exIkcVx7z8slR2mq8jgHDZ4h
 LSvWbn9oBHJ7n93x7wTnAYmBlYKYuWtgyllWyoxERxtHq+UK5cROCj3hM
 2Yyl6g9Z5yEbQ59zHNxb2Rsyt4Y1vAbjSBBix+wJ0LI4J3HFwn5+ECCg0
 gA+oVuut01PZNmWB/hMDASOeAalaCvWZ21nB1f1EeGvxuibm5hBsFwmHV
 4w46+2TokNcU5P1SE+2R0VUZmU0kW8d7xHMxVcd31+7KIozDnmTfwIeIW Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="255872419"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="255872419"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 01:12:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="695057450"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 06 May 2022 01:12:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 6 May 2022 01:12:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 6 May 2022 01:12:13 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 6 May 2022 01:12:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDejtfaNFztjXaleUNi6kPVe6gfFWm8wRh6ND6tjPjim50CaRBf7t2oZn2ihB8sl2a8mZfNZynjukEYChB89Cr4uf7R2+26HGeUIeg8KwxlyelwlkhmJIqHJxxzXccTqKHVIMtKglKV7fRrhsOl9KG3+EjYvhX7ByT1+eBXnJcmKN47VURsqYW89c8VbnQmDC+4llpdlUDq8pw3Lb1NgqJHd4AGYqkSaow/JkTEy9EjqQfL4CjomQKLk9GyVtZxpJQ8l9KZgOeh0iMeaQI8AvrzzCilvByLSbdffNoAJv7xqU7qGtfQ0diZgzbtpjCixHmns7KRyBZZktXJqKXSQjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHvBgKFjqTCHzJieMWc2evBOyWdG6TfZSH2LFL0LhsI=;
 b=INx80t0B7sgX/NGZXOGXCu7uVUGlwN3mG0FE/cYxizYoDl/WcZ6/l+fG8PWXM4M8I8LnZ5L5lTx80RHO9f1E5HEzRJpRw/YyeP9zBB96bRtCyHs9PDtPgWQ+ha149zfXqnjrvsriyWgc3gvGZg/NL8IebTXLnzl0cHMJeFjcL6agnBh/Uq9OX6sX6mCkZhkuv6Qk0V8fFUpv9cXhegeCQOLbnNsi3z8AG5mtJ0aMyreh+9hHDXgq/+NSZ3M6O3ovZN2vrL8xf9aj8RAWoUahAtymFquL7nOjcUV9q44dxJ/OE2JsYz+4p6W4gg4NvcMQwVmi/pFbDSDQONTvJNn9sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5271.namprd11.prod.outlook.com (2603:10b6:208:31a::21)
 by DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 08:12:11 +0000
Received: from BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::3114:d1ec:335e:d303]) by BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::3114:d1ec:335e:d303%3]) with mapi id 15.20.5227.020; Fri, 6 May 2022
 08:12:11 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: David Woodhouse <dwmw2@infradead.org>, Baolu Lu
 <baolu.lu@linux.intel.com>, Steve Wahl <steve.wahl@hpe.com>, "Rodel, Jorg"
 <jroedel@suse.de>, Kyung Min Park <kyung.min.park@intel.com>, Will Deacon
 <will@kernel.org>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>
Subject: RE: [PATCH] iommu/vt-d: Increase DMAR_UNITS_SUPPORTED
Thread-Topic: [PATCH] iommu/vt-d: Increase DMAR_UNITS_SUPPORTED
Thread-Index: AQHYYLnAHmosHc2CfUSQkp312mWw2q0RWsAAgAAL7nCAAApVgIAACKSw
Date: Fri, 6 May 2022 08:12:11 +0000
Message-ID: <BL1PR11MB5271099D98542F8A3F877D4E8CC59@BL1PR11MB5271.namprd11.prod.outlook.com>
References: <20220505194658.246121-1-steve.wahl@hpe.com>
 <e2afd89c-b1cf-9fde-4ce2-4be3c1fdaf07@linux.intel.com>
 <BN9PR11MB5276F4D5F8AD33293233B9AB8CC59@BN9PR11MB5276.namprd11.prod.outlook.com>
 <636a680eb85aded76dd765ba297347ceadc3d1a4.camel@infradead.org>
In-Reply-To: <636a680eb85aded76dd765ba297347ceadc3d1a4.camel@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 592c4393-c203-46b0-a184-08da2f381f0f
x-ms-traffictypediagnostic: DM4PR11MB5358:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM4PR11MB53587254E30F89A8D4A50A088CC59@DM4PR11MB5358.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f/cGYO94kvV6RIEkckZGH0Ns12zlPIWN4mq939/LezUgUGkXllf3gIJxlkEd/XwP41i96Uw2751sD6N2CHtajotezko4VYB82pvGTwSLt7ksIo6HngB9XtuYz8klBpqswLP5YR/SoBzs5fJHtnp5ThRew2C4flj3stUEeGClXgS1FqNY9b9+Nxu0GmXBJ9zXCaFJ1125Hu/BUcPiMc9idakpp4y4ssI2MDAPPNcqE4WL/BqOiszsli/Wx4NPNT0WvKths9ZUb6KMwcsRjZMCLlFa4Tkr457OlRPH7KKE9T+ngpGzQd9IDe/RfBcnBvgUnMejObkHxqa3t+as0tUDjRNMEhssG8DlAhGO2Dp6mZQA738wq5SUzA+iS5nFKdbvl32JBQKIMVcLiKMAUIxF8/SyBbnzZxKJoeRJSHUTw325wCiJkj+xFfjeZ6JQbxu6Kcn/JcLekp+n7r4Elqyp16DnCYBvqL1ezia+X5TKjKId5eJr/A7R9k9HR7W3zEcrARrN4iW5kT6slmBLRdBeFNNao7HmbEtCqB0Yv0BXGzry95mcoL7sA/o5uPfNrx1/L910ZfXT/3OSRop0XftxNwyPDluE62mWIxPqmOR00VS1rbdbX9lufwwm8t3K8r31Dmv3ofXdWVwESvNHqh/ygX3uicwLqmiRRXjgAOUUW4VLGaG6QBjopuBnwOOe10bubg2at5Av+G2tuovTLBnqCw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5271.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(508600001)(8936002)(71200400001)(52536014)(55016003)(7416002)(5660300002)(86362001)(82960400001)(33656002)(26005)(122000001)(9686003)(186003)(316002)(54906003)(110136005)(38070700005)(38100700002)(7696005)(66946007)(76116006)(64756008)(4326008)(66446008)(66476007)(66556008)(6506007)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTJrSkVSNVNLcDR5U1ZMcmE2bDVLbzJjdEMxdFZISnFXcFF5SUYrU05WUkpJ?=
 =?utf-8?B?N0h2YzNBZWcrME0wQ3JaTDAxTWlmdVEvZ1dqejVpYUhJTkJtcjlOb0pMU0Yw?=
 =?utf-8?B?SEJJUzZrSG5telQyQmxGdy9JSHd0UUh3ajVvYjNZYXRHdFlpM25zelBJR1Bo?=
 =?utf-8?B?MTk5TDB1Y1RDaXJTSjVZazhtOFhlK2hUdHZHRVU0NVRGOFBvVHM5R1dnRzk4?=
 =?utf-8?B?cEVWTEF2TkpJWEFKU0RndTFuZ21XdUpJbzBjUDA4TlRBemYxemVId3JhMWRq?=
 =?utf-8?B?Yk1TY2Vic2dUMXZZS1lNbTNDbU0xTVNSSzBQcGtMY3FGWXpWT2lwcUNzV0hl?=
 =?utf-8?B?L2VONnRPQUlvTWxOcmxKQk1uenB0OTZrZUhBOUVLOERlSGNsZU1FUDg5bng2?=
 =?utf-8?B?eGkwOWN5Snd4ME9RVzk2QUdpOVAvU1hkeE5ibUV6c211Rm1PMzI3M2xsTkpX?=
 =?utf-8?B?L2RVajQwTWY2OXU3QlZFL0hKU2pLbzBENGVmVDh5d3dER3Z6L2RUK2NpdWls?=
 =?utf-8?B?dUlJeEZ1NHdoS2lGRmZSc0paTi9PM3h2RGFZM1oxYnFmNFBpTmlTM1Z1d3JS?=
 =?utf-8?B?OXNRb1NyTXh5S1BJMittNE93azc2ckkyeFF0VE9pRHo4MCtSTkx0ZGVPSnZP?=
 =?utf-8?B?MVdXRlgwZkpQRVJvdTJOemRuVWE2eExBSUhmUTNzRGVNVFBEY1hLQU5meEk3?=
 =?utf-8?B?UUZKSlBqcGcrSUNxemxydVZ5KzBNWFBXWUFuRk9TdklXa2xmTURxVFoyZlBH?=
 =?utf-8?B?SzB1aXJhK1k3WktibmpINlVrNTI2NktJS1N1Qlk5VXI2SGVNUkJ4dU5kaUN2?=
 =?utf-8?B?UWhFOFMvelhNcE1veFlXUldwOUJGQkY0b25pNzB3c2FSdW11L1EzNVF3Ykdh?=
 =?utf-8?B?THgwWk5kTVk3QlBpUW9iWjZVWnhXTlQyN3pwdVZGVXlLVU52Smx5SXAzbkZn?=
 =?utf-8?B?STZkV3h5WXM4VTRJNEw4NE9MaU8wUGRHa3lhU0RhVEVURFJSNzFza2hNRjZ2?=
 =?utf-8?B?LzNHWE9rTGovQ2dad1FWQ0d3NXNvSkVVYllaTjgxdFdtMmdlYUZqaVJOUjNW?=
 =?utf-8?B?aEY2ZWhRYW9aNkxyVjVET1VwTnZVN1hjSXl0K0FFcmJBWVg1QStnWDk4NHQw?=
 =?utf-8?B?TmFlMVI2Mnp5WklSVjVENGFCMDBCVEcwWGJNeExKTkNyYUMxanlCRWQxMGcw?=
 =?utf-8?B?eFlCbDhCaTBqM1BlSGU1QkpSVnNPajI3ekplOG9hckhIRis3dW91eGpNNXB4?=
 =?utf-8?B?TmhENTZsbWM0THRGZFYzQUF5OEI3bmxlMDlVd1VkM2tkMGlJN0dxRUh0cmwr?=
 =?utf-8?B?K2lHU3JNWVFQcDI1a3VQSXcwY2NHRmtjd1pxcXVxVjJERXhSa21KTHpQWnUr?=
 =?utf-8?B?UGViR3lSWGRPek94ME5SOWpFSkJvNTlITFFoL1VXZW5GOFk0aWpDV20rMXRm?=
 =?utf-8?B?RytDcUN0d3pEWG8wMVFBaXBUZUZHSC80SWV5U3g5YUV4RTc0VEZmWGxxcjAv?=
 =?utf-8?B?Q0pVMVl2Y1M4VDFpRE9VUWdJUU1pMldvRlFLVm5FdTFycWRYZTRQTTc5TTF4?=
 =?utf-8?B?aEM5NERNZk4vZVJLbWxnZDV6TmkzSEFobmdwMCszdGZLT2I4Zi85dm5WZ0ho?=
 =?utf-8?B?ZFU3d1BESmFpWmV1OE1abnFybHJMdjB0c2hkT2tORW9EK0pMM2ZodFZsck95?=
 =?utf-8?B?bWtKb0xVU0FwbmJjRGNzZmxjT1gwY1g0OTRtU2RFVDk4amUrUGFKODczUENr?=
 =?utf-8?B?UUNqbndDM1h1L0ZzYTIyWjlpS2hmd212UndqanloY0NBTG01QmpKMHNDbnZo?=
 =?utf-8?B?WXltVGhyWWtpeklNTzEzeXJiQ1pXYUpzdW45eHNFeWxiZnkvUjhHZkNwVVh1?=
 =?utf-8?B?TmUzU1BKdEM2S0ZOM2YyNkt0YzhYSGNHRDIxNnd4eGsyVUtoUkNsZ0phR1dP?=
 =?utf-8?B?L1NkeEUyVE5RS0plK0hVNFdVTldnWW4zeXlWbE1MRFk4eXFyc2ZjaXJqNGU1?=
 =?utf-8?B?WUs1eW13T2lCV1BNWE9XNHZSbSt6NE9ZN25pdGFhZkZwLzM2NVYxVGt3bEh3?=
 =?utf-8?B?WTNPOWRGV1pmMnJjams4em5IR2pOajZQZjlwenhHS3J2bUVTRWpYaTNXSzRq?=
 =?utf-8?B?RU55WnJDTjZnK3o0YXpvVDNmN0ZrQkNzNUhMQTJaa1ExSFhTaEgrbEtwWUNF?=
 =?utf-8?B?dVpjQTF1Ny8zbisvZDBlTEFZSmlLMnU5VTN3UnFLd201d2RmTWNJbVlWNXZO?=
 =?utf-8?B?aEJLWHc5V1lxQjBDcktmTnVpZ0FYWGp6ZGxNem1Mb1lVcEFxZFdUdldGaEJX?=
 =?utf-8?B?S0FZRWtrUlREVk44NklCSHJPRFBpb3dQZkZKakh6N2ZGbG0vYktydz09?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 592c4393-c203-46b0-a184-08da2f381f0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2022 08:12:11.1982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Df/rrYODxAAD7kPWotCGw5mupwv7VpKb9UZZ3D0XYItJ/Wocx+2kvFxtnr2unc6KXHuZqdIQP6ZMJoe1qd6k/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5358
X-OriginatorOrg: intel.com
Cc: Mike Travis <mike.travis@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Anderson,
 Russ" <russ.anderson@hpe.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

PiBGcm9tOiBEYXZpZCBXb29kaG91c2UgPGR3bXcyQGluZnJhZGVhZC5vcmc+DQo+IFNlbnQ6IEZy
aWRheSwgTWF5IDYsIDIwMjIgMzoxNyBQTQ0KPiANCj4gT24gRnJpLCAyMDIyLTA1LTA2IGF0IDA2
OjQ5ICswMDAwLCBUaWFuLCBLZXZpbiB3cm90ZToNCj4gPiA+IEZyb206IEJhb2x1IEx1IDxiYW9s
dS5sdUBsaW51eC5pbnRlbC5jb20+DQo+ID4gPg0KPiA+ID4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4
L2RtYXIuaA0KPiA+ID4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2RtYXIuaA0KPiA+ID4gPiBAQCAt
MTksNyArMTksNyBAQA0KPiA+ID4gPiAgIHN0cnVjdCBhY3BpX2RtYXJfaGVhZGVyOw0KPiA+ID4g
Pg0KPiA+ID4gPiAgICNpZmRlZglDT05GSUdfWDg2DQo+ID4gPiA+IC0jIGRlZmluZQlETUFSX1VO
SVRTX1NVUFBPUlRFRAlNQVhfSU9fQVBJQ1MNCj4gPiA+ID4gKyMgZGVmaW5lCURNQVJfVU5JVFNf
U1VQUE9SVEVECTY0MA0KPiA+ID4gPiAgICNlbHNlDQo+ID4gPiA+ICAgIyBkZWZpbmUJRE1BUl9V
TklUU19TVVBQT1JURUQJNjQNCj4gPiA+ID4gICAjZW5kaWYNCj4gPg0KPiA+IC4uLiBpcyBpdCBu
ZWNlc3NhcnkgdG8gcGVybWFuZW50bHkgZG8gMTB4IGluY3JlYXNlIHdoaWNoIHdhc3RlcyBtZW1v
cnkNCj4gPiBvbiBtb3N0IHBsYXRmb3JtcyB3aGljaCB3b24ndCBoYXZlIHN1Y2ggbmVlZC4NCj4g
DQo+IEkgd2FzIGp1c3QgbG9va2luZyBhdCB0aGF0LiBJdCBtb3N0bHkgYWRkcyBhYm91dCAzwr0g
S2lCIHRvIGVhY2ggc3RydWN0DQo+IGRtYXJfZG9tYWluLg0KPiANCj4gSSB0aGluayB0aGUgb25s
eSBhY3R1YWwgc3RhdGljIGFycmF5IGlzIHRoZSBkbWFyX3NlcV9pZHMgYml0bWFwIHdoaWNoDQo+
IGdyb3dzIHRvIDY0MCAqYml0cyogd2hpY2ggaXMgZmFpcmx5IG5lZ2xpZ2libGUsIGFuZCB0aGUg
bWFpbiBncm93dGggaXMNCj4gdGhhdCBpdCBhZGRzIGFib3V0IDPCvSBLaUIgdG8gZWFjaCBzdHJ1
Y3QgZG1hcl9kb21haW4gZm9yIHRoZQ0KPiBpb21tdV9yZWZjbnRbXSBhbmQgaW9tbXVfZGlkW10g
YXJyYXlzLg0KDQpUaGFua3MgZm9yIHRoZSBxdWljayBleHBlcmltZW50ISB0aG91Z2ggdGhlIGFk
ZGVkIG1hdGVyaWFsIGlzDQpuZWdsaWdpYmxlIGl0J3MgY2xlYW5lciB0byBtZSBpZiBoYXZpbmcg
YSB3YXkgdG8gY29uZmlndXJlIGl0IGFzDQpkaXNjdXNzZWQgYmVsb3cuDQoNCj4gDQo+ID4gRG9l
cyBpdCBtYWtlIG1vcmUgc2Vuc2UgdG8gaGF2ZSBhIGNvbmZpZ3VyYWJsZSBhcHByb2FjaCBzaW1p
bGFyIHRvDQo+ID4gQ09ORklHX05SX0NQVVM/IG9yIGV2ZW4gYmV0dGVyIGNhbiB3ZSBqdXN0IHJl
cGxhY2UgdGhvc2Ugc3RhdGljDQo+ID4gYXJyYXlzIHdpdGggZHluYW1pYyBhbGxvY2F0aW9uIHNv
IHJlbW92aW5nIHRoaXMgcmVzdHJpY3Rpb24NCj4gPiBjb21wbGV0ZWx5Pw0KPiANCj4gSG90cGx1
ZyBtYWtlcyB0aGF0IGZ1biwgYnV0IEkgc3VwcG9zZSB5b3Ugb25seSBuZWVkIHRvIGdyb3cgdGhl
IGFycmF5DQo+IGluIGEgZ2l2ZW4gc3RydWN0IGRtYXJfZG9tYWluIGlmIHlvdSBhY3R1YWxseSBh
ZGQgYSBkZXZpY2UgdG8gaXQgdGhhdCdzDQo+IGJlaGluZCBhIG5ld2x5IGFkZGVkIElPTU1VLiBJ
IGRvbid0IGtub3cgaWYgdGhlIGNvbXBsZXhpdHkgb2YgbWFraW5nIGl0DQo+IGZ1bGx5IGR5bmFt
aWMgaXMgd29ydGggaXQgdGhvdWdoLiBXZSBjb3VsZCBtYWtlIGl0IGEgY29uZmlnIG9wdGlvbiwN
Cj4gYW5kL29yIGEgY29tbWFuZCBsaW5lIG9wdGlvbiAocGVyaGFwcyBhdXRvbWF0aWNhbGx5IGRl
cml2ZWQgZnJvbQ0KPiBDT05GSUdfTlJfQ1BVUykuDQoNCmVpdGhlciBjb25maWcgb3B0aW9uIG9y
IGNvbW1hbmQgbGluZSBvcHRpb24gaXMgT0sgdG8gbWUuIFByb2JhYmx5DQp0aGUgZm9ybWVyIGlz
IHNpbXBsZXIgZ2l2ZW4gbm8gbmVlZCB0byBkeW5hbWljYWxseSBleHBhbmQgdGhlDQpzdGF0aWMg
YXJyYXkuIGJ0dyB0aG91Z2ggZGVyaXZpbmcgZnJvbSBDT05GSUdfTlJfQ1BVUyBjb3VsZCB3b3Jr
IA0KaW4gdGhpcyBjYXNlIGl0IGlzIHVuY2xlYXIgd2h5IHR5aW5nIHRoZSB0d28gdG9nZXRoZXIg
aXMgbmVjZXNzYXJ5IGluDQpjb25jZXB0LCBlLmcuIGlzIHRoZXJlIGd1YXJhbnRlZSB0aGF0IHRo
ZSBudW1iZXIgb2YgSU9NTVVzIG11c3QNCmJlIHNtYWxsZXIgdGhhbiB0aGUgbnVtYmVyIG9mIENQ
VXMgaW4gYSBwbGF0Zm9ybT8NCg0KPiANCj4gSWYgaXQgd2Fzbid0IGZvciBob3RwbHVnLCBJIHRo
aW5rIHdlJ2Qga25vdyB0aGUgcmlnaHQgbnVtYmVyIGJ5IHRoZQ0KPiB0aW1lIHdlIGFjdHVhbGx5
IG5lZWQgaXQgYW55d2F5LCB3b3VsZG4ndCB3ZT8gQ2FuIHdlIGhhdmUgYSBoZXVyaXN0aWMNCj4g
Zm9yIGhvdyBtYW55IERNQVIgdW5pdHMgYXJlIGxpa2VseSB0byBiZSBob3RwbHVnZ2VkPyBJcyBp
dCBhcyBzaW1wbGUgYXMNCj4gdGhlIHJhdGlvIG9mIHByZXNlbnQgdG8gbm90LXlldC1wcmVzZW50
IENQVXMgaW4gTUFEVD8NCg0KUHJvYmFibHkuIEJ1dCBJIGRvbid0IGhhdmUgZW5vdWdoIGtub3ds
ZWRnZSBvbiBETUFSIGhvdHBsdWcgdG8NCmp1ZGdlIChlLmcuIHdoZXRoZXIgaXQncyBzdHJpY3Rs
eSB0aWVkIHRvIENQVSBob3RwbHVnIGFuZCBpZiB5ZXMgd2hldGhlcg0KdGhlcmUgY291bGQgYmUg
bXVsdGlwbGUgSU9NTVVzIGhvdHBsdWdnZWQgdG9nZXRoZXIgd2l0aCBhIENQVQ0Kc29ja2V0KS4u
Lg0KDQpUaGFua3MNCktldmluDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
aW9tbXU=
