Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDE85540EC
	for <lists.iommu@lfdr.de>; Wed, 22 Jun 2022 05:31:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40E07418F1;
	Wed, 22 Jun 2022 03:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40E07418F1
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=duu4PFfL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SIL7qAhCRTeT; Wed, 22 Jun 2022 03:31:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9F6EA41853;
	Wed, 22 Jun 2022 03:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F6EA41853
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 624F2C0081;
	Wed, 22 Jun 2022 03:31:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D2D9C002D
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 03:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4921B6122A
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 03:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4921B6122A
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=duu4PFfL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Qu-jZNi7Jvv for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jun 2022 03:31:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52FB361228
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52FB361228
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 03:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655868694; x=1687404694;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rrA6pMgimi/EWN254N91KMUfYiAEq3HPWrwi8oLBRgc=;
 b=duu4PFfL5qHCreS0TLx4xbA89YYtGU+xM37pd92kIrjV0ocopeh3Oh7y
 2DBA+79ECzz7dzvAVyLA56pEDQvFBUKNgm0qmmtBUMV+/0ea2Pbqwru1/
 QqbVvvmnLW3mtMw0UDGVyALcM0nL87JGI97QkLLqrrA61AcD/wkmj7wPQ
 EPQdPysccuVKXzXzRdwphhCbWDtDJOK/VGYPAVP+q31nQ4SHb3u/qna2B
 WpiT83ip3FY5Aw0A+oHFwm6zOCWvRVqSPMlKmh1qv8aYenOxfkl6c1gqm
 Ut5LuQBwgwyYxGYy5ke4DHkRrLCEnndN6Xewg5nAYF6jhRmybbqMMiYNi A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="341985973"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; d="scan'208";a="341985973"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 20:31:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; d="scan'208";a="914438928"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 21 Jun 2022 20:31:30 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 21 Jun 2022 20:31:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 21 Jun 2022 20:31:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 21 Jun 2022 20:31:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=de7Kh6cJclllqzTBQGMSsJDB9xoIBW5+Oz4Mg1p5WfXSElY8vBVF8B7G18km//sKetj2klkI0YKbLdOH0w94j44g6B1+a4CduGy6aYCazybNq/Y1K19gt/IM77HXLWEhBClX/TWg7lhJR63au+IUI46OSJPovk3HljlcvxcFCJT6q2vf8tdbjm6INmqDXR3TxqLyOGs9h0mnnKu/XcNbBsGug8ylgOSJtCQ99c3Rk6lQ6xk48vx7WrBSC4wUpx7J7HERd5eIsXVHtTN6pIIeVpgl1hvsOMh4zPZQ3DuDb6w8yP9ouXaTUV+J6Yrhkvj1hGH3LAd6h0GAcRtpv2UpRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrA6pMgimi/EWN254N91KMUfYiAEq3HPWrwi8oLBRgc=;
 b=dpicjyzaJxnMnapgYPMQJ61Xv2QeRvRIvgdCtGOpSkLVC4TihJrCr1/EKdE4lcu3Bms4DC5BRprRl5amoNmO3K211Q9Yj1AkUcmB3mmxmagwdrcpRAdPQOqgXqraRqkxSWdlbIjbmCMPEK3HKkoVox60YTVA67WCdx7w+esIcJMW7HdsnkAG5x8Vfx4Gdkj8wwLU6C4VUlEq69BZKcZ5dVRpLmPOww6R17NpICxfWbUJxxtJnTP8/KHTHBpyBPsKy8KGJvcBsEkKyhDCakeJea4lhtYHzub+ZZNHxzXnlL55+TmTHtHO1Mbr7CydEuXoPh5fktarS81hP2q9xZgizQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MN2PR11MB3774.namprd11.prod.outlook.com (2603:10b6:208:fa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.19; Wed, 22 Jun
 2022 03:31:28 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 03:31:28 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, "Raj, 
 Ashok" <ashok.raj@intel.com>
Subject: RE: [PATCH 1/1] iommu/vt-d: Fix RID2PASID setup failure
Thread-Topic: [PATCH 1/1] iommu/vt-d: Fix RID2PASID setup failure
Thread-Index: AQHYhH7LXPufoGLZlE+CLUNrmpMHyq1ZKuMwgAANHACAAADskIAADMMAgAAVB6CAADfkAIABLcrQgAAGpICAAADuUA==
Date: Wed, 22 Jun 2022 03:31:27 +0000
Message-ID: <BN9PR11MB52764776AA25E73721396DC88CB29@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220620081729.4610-1-baolu.lu@linux.intel.com>
 <BN9PR11MB52764F60972DF52EEF945D408CB39@BN9PR11MB5276.namprd11.prod.outlook.com>
 <5d13cab5-1f0a-51c7-78a3-fb5d3d793ab1@linux.intel.com>
 <BN9PR11MB527671B3B4C1F786E40D67408CB39@BN9PR11MB5276.namprd11.prod.outlook.com>
 <80457871-a760-69ba-70be-5e95344182ea@linux.intel.com>
 <BN9PR11MB5276A8B4E2466BE080CA9E9B8CB39@BN9PR11MB5276.namprd11.prod.outlook.com>
 <ff4d8dab-e409-1e5d-74c5-ddbb65c2ba03@linux.intel.com>
 <BN9PR11MB52763B34313DD178B44BA2578CB29@BN9PR11MB5276.namprd11.prod.outlook.com>
 <4316fa3e-3183-beb0-9c4a-d6045c6b5340@linux.intel.com>
In-Reply-To: <4316fa3e-3183-beb0-9c4a-d6045c6b5340@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7fef918-3341-4b1b-971a-08da53ffb123
x-ms-traffictypediagnostic: MN2PR11MB3774:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR11MB3774A769192E6CBE2DE1CEB18CB29@MN2PR11MB3774.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FQWtdrU3EbZ1xId6aEdJ8KVWyAjcPk5guuWHy3kUB5/jj0CirHtHt4Omew5wjcJOO3h1NHWOcGpLY84/WIn2ytl4lL1pEnqs/39f+G3myCws7o33iR3uTa8lJCH60rCqEKYRm+bOe1Oc6DbTvRUJHTc29TsTuuUNdbMJFu17fiWQYjhS3gziaiP8EYsq5TaGGnu2qIG1kydNBew861WJ+sIkfMCFiqcD984tip6E6avjgqvmUU0ezHf/SPUbl50BWLRH6MSF49nOfoK6m6VB37tJXxjaeTvDLNW89XDhfn3rJmQSwWRPQ3H8x4xCWG9HKMjQrE8cgQ0XZRKc4hwGUoGeeaBS4a1QuoYx4WqLjKq8AtAnOjQyWtcOO0claMtynodWW5Dw1YX5EWvSVbGHUEWkeG/cFmnRa3qbdBXgk8VwFVTeKewwNCDJRNcHgINpqMca0evxKcs5rqiW03UzjnfBUUNv2I/SneZLE0JdLlttDngQk4Po+oHuxkUVfHgurgJC/A2KyrnA7wCnsEPvvKDD8iC8js7bAxd346soLZaLVH73JN6n6e2Y+/sZCc+qgqIQHsjkad3jOg56em7zxgGYpt32mBmeXvYu6hpYLO1GgaDvqe6DCCraE32kgggo/bh5WNsj8d0UTQVj/0ytkBfh0YvUZ1gfD0mzpQWFyt4ii2PLAaah9/dWgvlpwloKT0IK/rKdgjhBNZgTIaYYTA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(366004)(136003)(346002)(39860400002)(186003)(66556008)(4326008)(55016003)(8676002)(64756008)(478600001)(52536014)(76116006)(66946007)(6636002)(71200400001)(6506007)(110136005)(82960400001)(66476007)(41300700001)(26005)(83380400001)(7696005)(53546011)(66446008)(9686003)(86362001)(54906003)(38100700002)(8936002)(33656002)(38070700005)(2906002)(122000001)(316002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWZiOVpaalpxdCtTMm1odzdsVWc2UFBiT0dPcGNVclhXeHN6bjk1aHZVZGhw?=
 =?utf-8?B?M04weUtzZmd6eDRaSDR1R3Y4dHQzRXp3dXhOeTZURzlPQkVGeHBFZzF1OW92?=
 =?utf-8?B?REY5ZWt1SElKR0lVTEJnTEhCUC9EOWtEdFV0b0JGaFd1cEFJazM4aCt2aTI1?=
 =?utf-8?B?QXREZlQwNDZjODlReE00ai9uVUcwc2lUQ1JQQzBDajBHa3pwTm9wYUN3ZFBY?=
 =?utf-8?B?MEc0ODJpWGhQM3MxUGFFZ2l6cFVVYnVNTTQ2MlBITEh0SDNYNURkK1Nkb1FW?=
 =?utf-8?B?ZjN3UWY1RFhNSE90cXFmcGJlMHJMV2JxUVA3eWxLdDJwQTBFclJZenNWa2pm?=
 =?utf-8?B?T3cvRkhNYjVyTlR4VGNUR0FhdHY2TmZOY05FdTk5dno2VEVaK3RoV252U2xG?=
 =?utf-8?B?YjlTY0I2dFRGclhoRzZEejlhQWVsdWZUNG1DUEtNUU8ycGxCaFhWanRseXFW?=
 =?utf-8?B?YTQvMXd3eFZMSVA4UDROQ0h2ZFlldzRrbmtUOHJpaXcyamdCalBweUluSFJT?=
 =?utf-8?B?LzREODZWc09wbXNSTm1jT1h1cXI5QUxGSmw4QjRHYU8wb1RiZE1sR00wZzlG?=
 =?utf-8?B?MVRqUzJKRG5Dclh3U3pvcTd4a0djTkdsbmdXUFRDY2x2QktmbVRSd3o1dW85?=
 =?utf-8?B?a21lTWF2VzB4K1krd1R3SkIrSGJQNkVVRGlDZ0dnSUZ4L3VJL2JRYjZBN2pU?=
 =?utf-8?B?eTZjK1NYc0lIb245V1crKzhtN3JrRzFGVFoyeVZ6L3VhNFFEWXo4cGd4Z2x0?=
 =?utf-8?B?c0dtRm1EU1F5azJxNzZOSERrK0JoYmlNdVNjRlg2dm5UQVBmQTYxekhiSC9q?=
 =?utf-8?B?ejIwQ1RpZWgwSUlLa2dlaFpuaHZ2OVVLN3pyK21GWUhWb2hLakkvNGhLYzF3?=
 =?utf-8?B?QTlxNWRPWHNhSzYzMy9ENUxkNXZadFV4RjJrb0hzZzBZR0I5MThLMTlRQmlq?=
 =?utf-8?B?U0JxOW4yVGc1SWYyZVVtVmJXdmJyYUozK0dFcHM2OFlPdUJ2cGZxR0RXRUJP?=
 =?utf-8?B?NkoxZWZ1aEwrMkZOT0QzL0s5K2tFb0ZxK3RaU0hxb1RQbmZnSzZHdVMvYTBn?=
 =?utf-8?B?dWhnQTZVZkhTWXFxM2oraGRiN1Z5RUR4Y0M4MWJRN2JCNG1VZFI4ekxQWGg5?=
 =?utf-8?B?Z0lVL3hPUmZCRzkrRThjQmVYTnQwemVOTmo0TTVjMzRadk1ZK3lPbzIrOCtJ?=
 =?utf-8?B?eVRPQlRhMTd6dDNFS0lwYll0TE1Jem1VcG1OZy9TTFFGVDdxNlVhdG56enEz?=
 =?utf-8?B?L3NnNDBFRjZBYldVQ05obHB2c0lycCswaTVxWGRZaDUzTytRSm5neEZQblh2?=
 =?utf-8?B?QUdNQ1Jya0FFUmNuZmg5cUdxREs5bnhrdUs5RmV0d0RnalJwZkFCNklGMjEz?=
 =?utf-8?B?Y2ZualNGYmd1NlUyaHNETG5DYTA1NkRpSjdvNEQzMHplOXlxZlZSeDlzeXJn?=
 =?utf-8?B?QmovMC9qRnBjZnJKeXI5Ky9iRzZKVWorSk9uM3pMdnE2TFdCQWc0MkNGcld3?=
 =?utf-8?B?U3pQdUVTc0t4aGwyclhtZExoS2hkRStXb21hVXN1cklSdlExSVFBZ2RDb1B5?=
 =?utf-8?B?b0Q2eVN4UmZsZHk2Mk1BZml5SHZBOWR4WWVHVXdhVFF1Uy9yYXpjUmpqMHVS?=
 =?utf-8?B?RmNhMUt0VVF1RHZLWThVYUg4V1B2clNxdFBlN0tvcTdNK1h4QThuUWxDbVh5?=
 =?utf-8?B?QmFTdDFkSW1kZWoyOE50dFBrVFB2WmtzWG16U044bEU4eDhkbDFnUkU0QzFy?=
 =?utf-8?B?Qy9SdFVZYk1vdk81cVkvUmtKaTBZcWxSWHBvcTZqTXBBR1l5T2Mwa1VBSytG?=
 =?utf-8?B?NDV3dnZKMjB2aWQvelBKZE1CNzFZdzZ1T3VCQ1NrcDh3clZxRUh2OW42T0xm?=
 =?utf-8?B?S0ZzZlpodzN2U3huN2dodnZ4Q1VWWGFoamltdkNFbXNWOGZLT25rdDZrOXJt?=
 =?utf-8?B?dkNMQ2cwTUtteXhXaGNQa2Z0SUkzdFJ6WHU5MXluRkpHU1hjSVp4SCt4T0Fj?=
 =?utf-8?B?bVdVSGlwbGpyRXhhYmh6K0VieDhpcVE3bXNjYm94UlFmcWNMamFia0NiYVVz?=
 =?utf-8?B?L2swUzlqb0pKVERuZC9nWW02K0ZDTFU4M21qTTU0VzlrQnB6c2VOMEdIRW5x?=
 =?utf-8?B?bEFlcXNDK2ZlOFBNaW1hYmZlUkJKcE9ycjd1NjBnMDYzL2ZkWHRsVlcvRlN5?=
 =?utf-8?B?bFgxNnRhVnVUMEZ6MzJlVTRVWHdUdjFUVWVYUXZZVUR0UUl3b01VQXFQUm4y?=
 =?utf-8?B?MTJOK1IxSTgwNlo2Q091eDVRbnQ4RkFKU2ZZdmdsa2xvOTlTYlNLNW9CRWJt?=
 =?utf-8?B?ejRkL2pQTklxdmhvdFVURll3eEhZazZ2K2VUZGQxcHRLdlpleDZqZz09?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fef918-3341-4b1b-971a-08da53ffb123
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2022 03:31:27.9387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5cbIQJmC4uu0xfPmV0n3KfUNmw/J0bxxWm4spqptLsowhQxGQlCX3omjkVxSZjv7xhjKA+hxzkqzuZL2vRCa0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3774
X-OriginatorOrg: intel.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "Qiang,
 Chenyi" <chenyi.qiang@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>
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

PiBGcm9tOiBCYW9sdSBMdSA8YmFvbHUubHVAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBXZWRu
ZXNkYXksIEp1bmUgMjIsIDIwMjIgMTE6MjggQU0NCj4gDQo+IE9uIDIwMjIvNi8yMiAxMTowNiwg
VGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4+IEZyb206IEJhb2x1IEx1PGJhb2x1Lmx1QGxpbnV4Lmlu
dGVsLmNvbT4NCj4gPj4gU2VudDogVHVlc2RheSwgSnVuZSAyMSwgMjAyMiA1OjA0IFBNDQo+ID4+
DQo+ID4+IE9uIDIwMjIvNi8yMSAxMzo0OCwgVGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4+Pj4gRnJv
bTogQmFvbHUgTHU8YmFvbHUubHVAbGludXguaW50ZWwuY29tPg0KPiA+Pj4+IFNlbnQ6IFR1ZXNk
YXksIEp1bmUgMjEsIDIwMjIgMTI6MjggUE0NCj4gPj4+Pg0KPiA+Pj4+IE9uIDIwMjIvNi8yMSAx
MTo0NiwgVGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4+Pj4+PiBGcm9tOiBCYW9sdSBMdTxiYW9sdS5s
dUBsaW51eC5pbnRlbC5jb20+DQo+ID4+Pj4+PiBTZW50OiBUdWVzZGF5LCBKdW5lIDIxLCAyMDIy
IDExOjM5IEFNDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gT24gMjAyMi82LzIxIDEwOjU0LCBUaWFuLCBL
ZXZpbiB3cm90ZToNCj4gPj4+Pj4+Pj4gRnJvbTogTHUgQmFvbHU8YmFvbHUubHVAbGludXguaW50
ZWwuY29tPg0KPiA+Pj4+Pj4+PiBTZW50OiBNb25kYXksIEp1bmUgMjAsIDIwMjIgNDoxNyBQTQ0K
PiA+Pj4+Pj4+PiBAQCAtMjU2NCw3ICsyNTY0LDcgQEAgc3RhdGljIGludCBkb21haW5fYWRkX2Rl
dl9pbmZvKHN0cnVjdA0KPiA+Pj4+Pj4+PiBkbWFyX2RvbWFpbiAqZG9tYWluLCBzdHJ1Y3QgZGV2
aWNlICpkZXYpDQo+ID4+Pj4+Pj4+ICAgICAgCQkJcmV0ID0gaW50ZWxfcGFzaWRfc2V0dXBfc2Vj
b25kX2xldmVsKGlvbW11LA0KPiA+Pj4+Pj4+PiBkb21haW4sDQo+ID4+Pj4+Pj4+ICAgICAgCQkJ
CQlkZXYsIFBBU0lEX1JJRDJQQVNJRCk7DQo+ID4+Pj4+Pj4+ICAgICAgCQlzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZpb21tdS0+bG9jaywgZmxhZ3MpOw0KPiA+Pj4+Pj4+PiAtCQlpZiAocmV0KSB7
DQo+ID4+Pj4+Pj4+ICsJCWlmIChyZXQgJiYgcmV0ICE9IC1FQlVTWSkgew0KPiA+Pj4+Pj4+PiAg
ICAgIAkJCWRldl9lcnIoZGV2LCAiU2V0dXAgUklEMlBBU0lEIGZhaWxlZFxuIik7DQo+ID4+Pj4+
Pj4+ICAgICAgCQkJZG1hcl9yZW1vdmVfb25lX2Rldl9pbmZvKGRldik7DQo+ID4+Pj4+Pj4+ICAg
ICAgCQkJcmV0dXJuIHJldDsNCj4gPj4+Pj4+Pj4gLS0NCj4gPj4+Pj4+Pj4gMi4yNS4xDQo+ID4+
Pj4+Pj4gSXQncyBjbGVhbmVyIHRvIGF2b2lkIHRoaXMgZXJyb3IgYXQgdGhlIGZpcnN0IHBsYWNl
LCBpLmUuIG9ubHkgZG8gdGhlDQo+ID4+Pj4+Pj4gc2V0dXAgd2hlbiB0aGUgZmlyc3QgZGV2aWNl
IGlzIGF0dGFjaGVkIHRvIHRoZSBwYXNpZCB0YWJsZS4NCj4gPj4+Pj4+IFRoZSBsb2dpYyB0aGF0
IGlkZW50aWZpZXMgdGhlIGZpcnN0IGRldmljZSBtaWdodCBpbnRyb2R1Y2UgYWRkaXRpb25hbA0K
PiA+Pj4+Pj4gdW5uZWNlc3NhcnkgY29tcGxleGl0eS4gRGV2aWNlcyB0aGF0IHNoYXJlIGEgcGFz
aWQgdGFibGUgYXJlIHJhcmUuIEkNCj4gPj4+Pj4+IGV2ZW4gcHJlZmVyIHRvIGdpdmUgdXAgc2hh
cmluZyB0YWJsZXMgc28gdGhhdCB0aGUgY29kZSBjYW4gYmUNCj4gPj4+Pj4+IHNpbXBsZXIuOi0p
DQo+ID4+Pj4+Pg0KPiA+Pj4+PiBJdCdzIG5vdCB0aGF0IGNvbXBsZXggaWYgeW91IHNpbXBseSBt
b3ZlIGRldmljZV9hdHRhY2hfcGFzaWRfdGFibGUoKQ0KPiA+Pj4+PiBvdXQgb2YgaW50ZWxfcGFz
aWRfYWxsb2NfdGFibGUoKS4gVGhlbiBkbyB0aGUgc2V0dXAgaWYNCj4gPj4+Pj4gbGlzdF9lbXB0
eSgmcGFzaWRfdGFibGUtPmRldikgYW5kIHRoZW4gYXR0YWNoIGRldmljZSB0byB0aGUNCj4gPj4+
Pj4gcGFzaWQgdGFibGUgaW4gZG9tYWluX2FkZF9kZXZfaW5mbygpLg0KPiA+Pj4+IFRoZSBwYXNp
ZCB0YWJsZSBpcyBwYXJ0IG9mIHRoZSBkZXZpY2UsIGhlbmNlIGEgYmV0dGVyIHBsYWNlIHRvDQo+
ID4+Pj4gYWxsb2NhdGUvZnJlZSB0aGUgcGFzaWQgdGFibGUgaXMgaW4gdGhlIGRldmljZSBwcm9i
ZS9yZWxlYXNlIHBhdGhzLg0KPiA+Pj4+IFRoaW5ncyB3aWxsIGJlY29tZSBtb3JlIGNvbXBsaWNh
dGVkIGlmIHdlIGNoYW5nZSByZWxhdGlvbnNoaXANCj4gYmV0d2Vlbg0KPiA+Pj4+IGRldmljZSBh
bmQgaXQncyBwYXNpZCB0YWJsZSB3aGVuIGF0dGFjaGluZy9kZXRhY2hpbmcgYSBkb21haW4uIFRo
YXQncw0KPiA+Pj4+IHRoZSByZWFzb24gd2h5IEkgdGhvdWdodCBpdCB3YXMgYWRkaXRpb25hbCBj
b21wbGV4aXR5Lg0KPiA+Pj4+DQo+ID4+PiBJZiB5b3UgZG8gd2FudCB0byBmb2xsb3cgY3VycmVu
dCByb3V0ZSBpdOKAmXMgc3RpbGwgY2xlYW5lciB0byBjaGVjaw0KPiA+Pj4gd2hldGhlciB0aGUg
cGFzaWQgZW50cnkgaGFzIHBvaW50ZWQgdG8gdGhlIGRvbWFpbiBpbiB0aGUgaW5kaXZpZHVhbA0K
PiA+Pj4gc2V0dXAgZnVuY3Rpb24gaW5zdGVhZCBvZiBibGluZGx5IHJldHVybmluZyAtRUJVU1kg
YW5kIHRoZW4gaWdub3JpbmcNCj4gPj4+IGl0IGV2ZW4gaWYgYSByZWFsIGJ1c3kgY29uZGl0aW9u
IG9jY3Vycy4gVGhlIHNldHVwIGZ1bmN0aW9ucyBjYW4NCj4gPj4+IGp1c3QgcmV0dXJuIHplcm8g
Zm9yIHRoaXMgYmVuaWduIGFsaWFzIGNhc2UuDQo+ID4+IEtldmluLCBob3cgZG8geW91IGxpa2Ug
dGhpcyBvbmU/DQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L2ludGVsL3Bh
c2lkLmMgYi9kcml2ZXJzL2lvbW11L2ludGVsL3Bhc2lkLmMNCj4gPj4gaW5kZXggY2I0YzFkMGNm
MjVjLi5lY2ZmZDAxMjliMmIgMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvaW9tbXUvaW50ZWwv
cGFzaWQuYw0KPiA+PiArKysgYi9kcml2ZXJzL2lvbW11L2ludGVsL3Bhc2lkLmMNCj4gPj4gQEAg
LTU3NSw2ICs1NzUsMTYgQEAgc3RhdGljIGlubGluZSBpbnQgcGFzaWRfZW5hYmxlX3dwZShzdHJ1
Y3QNCj4gPj4gcGFzaWRfZW50cnkgKnB0ZSkNCj4gPj4gICAgCXJldHVybiAwOw0KPiA+PiAgICB9
Ow0KPiA+Pg0KPiA+PiArLyoNCj4gPj4gKyAqIFJldHVybiB0cnVlIGlmIEBwYXNpZCBpcyBSSUQy
UEFTSUQgYW5kIHRoZSBkb21haW4gQGRpZCBoYXMgYWxyZWFkeQ0KPiA+PiArICogYmVlbiBzZXR1
cCB0byB0aGUgQHB0ZS4gT3RoZXJ3aXNlLCByZXR1cm4gZmFsc2UuDQo+ID4+ICsgKi8NCj4gPj4g
K3N0YXRpYyBpbmxpbmUgYm9vbA0KPiA+PiArcmlkMnBhc2lkX2RvbWFpbl92YWxpZChzdHJ1Y3Qg
cGFzaWRfZW50cnkgKnB0ZSwgdTMyIHBhc2lkLCB1MTYgZGlkKQ0KPiA+PiArew0KPiA+PiArCXJl
dHVybiBwYXNpZCA9PSBQQVNJRF9SSUQyUEFTSUQgJiYgcGFzaWRfZ2V0X2RvbWFpbl9pZChwdGUp
ID09DQo+ID4+IGRpZDsNCj4gPj4gK30NCj4gPiBiZXR0ZXIgdGhpcyBpcyBub3QgcmVzdHJpY3Rl
ZCB0byBSSUQyUEFTSUQgb25seSwgZS5nLg0KPiBwYXNpZF9wdGVfbWF0Y2hfZG9tYWluKCkNCj4g
PiBhbmQgdGhlbiByZWFkIHBhc2lkIGZyb20gdGhlIHB0ZSB0byBjb21wYXJlIHdpdGggdGhlIHBh
c2lkIGFyZ3VtZW50Lg0KPiA+DQo+IA0KPiBUaGUgcGFzaWQgdmFsdWUgaXMgbm90IGVuY29kZWQg
aW4gdGhlIHBhc2lkIHRhYmxlIGVudHJ5LiBUaGlzIHZhbGlkaXR5DQo+IGNoZWNrIGlzIG9ubHkg
Zm9yIFJJRDJQQVNJRCBhcyBhbGlhcyBkZXZpY2VzIHNoYXJlIHRoZSBzaW5nbGUgUklEMlBBU0lE
DQo+IGVudHJ5LiBGb3Igb3RoZXIgY2FzZXMsIHdlIHNob3VsZCBhbHdheXMgcmV0dXJuIC1FQlVT
WSBhcyB3aGF0IHRoZSBjb2RlDQo+IGlzIGRvaW5nIG5vdy4NCj4gDQoNCllvdSBhcmUgcmlnaHQu
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBt
YWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
