Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C30B55B877
	for <lists.iommu@lfdr.de>; Mon, 27 Jun 2022 10:05:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68609408AF;
	Mon, 27 Jun 2022 08:05:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68609408AF
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FT7Yd7ql
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nSBnVnWkqJaM; Mon, 27 Jun 2022 08:05:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6180C403FF;
	Mon, 27 Jun 2022 08:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6180C403FF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07140C007E;
	Mon, 27 Jun 2022 08:05:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D892CC002D
 for <iommu@lists.linux-foundation.org>; Mon, 27 Jun 2022 08:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B246582CE5
 for <iommu@lists.linux-foundation.org>; Mon, 27 Jun 2022 08:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B246582CE5
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=FT7Yd7ql
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fXvEip4t0dLw for <iommu@lists.linux-foundation.org>;
 Mon, 27 Jun 2022 08:05:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26FB482B51
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26FB482B51
 for <iommu@lists.linux-foundation.org>; Mon, 27 Jun 2022 08:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656317123; x=1687853123;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C+vje1T5F8DDCy4IW41nJfZAeBXOJi/0LWc1Sk2rxI0=;
 b=FT7Yd7qlfXXKUPBANeYclD4nhD+qQHq3jLZwWrX5KDHvN0FFubDx+OnS
 WxRNYZ/3iplRUoy6kf2o3khZa4ZNAYrW58KI3RvqVYlvEfgA5fJ6Car/n
 NkGtMhVBiXvb7FxkgqUlKgIr5fgrC6LKQZa+WUNmxn/eqkXJlE+Dvitqp
 oUkuZ5sOhdhVVD/chCWLoC/mA2eScklWVNiOz07B0Ip4+b1tSVrb+WzpZ
 mCeDG2uUdl3c/co2bdMRvmHUNOH5uU0ord8dvx2Y6SqGqAa/YmxzYKIEl
 8ePz1Ob/tWlEFUkyzm91xMgHSSF7I9hfkA8R3rzgHABsvJwX88ujJ8bXD g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="282482235"
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; d="scan'208";a="282482235"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 01:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; d="scan'208";a="564562907"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 27 Jun 2022 01:05:18 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 27 Jun 2022 01:05:17 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 27 Jun 2022 01:05:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 27 Jun 2022 01:05:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 27 Jun 2022 01:05:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aswvz6Gez59Wlu/fZ1NzX0QM19Y/Jy4hCQc/a2vW1hmjyIPBpazvKO4GvEdfyS1BoYX6urraK+zqU5qCYpc3lNXWu+2MAhFKujrHfx+v9dDEpXqwqDTO77FrHfisjf9cCcK9LO2p8lhxPg3aahk40/m8qHK5SiJBJBTYsBzDsDuVHINe7NML3Kcf5/REtuIh1mMDAn0VKyvPvZvk3lGkk2YZN6UNDBnl897ThgM6R8s/kMYRlTF3garqP5P3hVzSoaENLkl/sVPGfKf/ANuCg6otR8rncyRLEDMi89iOlUkzvKZb++Zhzg0J3K9iLaL18dErFXR3i2B2z9NsHY8pyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+vje1T5F8DDCy4IW41nJfZAeBXOJi/0LWc1Sk2rxI0=;
 b=N/z8g/Cz96CeOkZuxyV1ulmV4XbFvKskvZB9U5Tl7PTd7pHfwaBnMkcXnplmHBqcql7GOQu0jo+kD1JPwiAfGlpoSOhiIhkhzkygONRTUlVWun5cFP17mPdjfvOyjCo9pliEWmq9sV2jhwOQBpMxsbmVVAjXqvl+T3UNEhJ+2pKNExoRtOQftLDViexLF5kQUoUTH/IyiJCnbdhO0Zch7py9UdHM/Xgua5JZHi6/RkTCCgrALwu72X8OzIIWsR9RGFs/T0dnD/Rd86R4EIgbF1D0vKymf9BDtn9F/1PDWIyqrQthbQPYCWE3QL5Zf4ZPAD5a9WfT7FWtsgXR/BEkwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH0PR11MB5078.namprd11.prod.outlook.com (2603:10b6:510:3e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 08:05:15 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 08:05:15 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 "Jason Gunthorpe" <jgg@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 "Raj, Ashok" <ashok.raj@intel.com>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>, Jean-Philippe Brucker
 <jean-philippe@linaro.com>, "Jiang, Dave" <dave.jiang@intel.com>, Vinod Koul
 <vkoul@kernel.org>
Subject: RE: [PATCH v9 01/11] iommu: Add max_pasids field in struct
 iommu_device
Thread-Topic: [PATCH v9 01/11] iommu: Add max_pasids field in struct
 iommu_device
Thread-Index: AQHYhX31rU/ZdbFERkaYYL2LNRxtSq1i7edw
Date: Mon, 27 Jun 2022 08:05:15 +0000
Message-ID: <BN9PR11MB5276A1972AA06D8FDABAD62D8CB99@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220621144353.17547-1-baolu.lu@linux.intel.com>
 <20220621144353.17547-2-baolu.lu@linux.intel.com>
In-Reply-To: <20220621144353.17547-2-baolu.lu@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a141cad-7fa6-4ce7-ad49-08da5813c4eb
x-ms-traffictypediagnostic: PH0PR11MB5078:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XYDIkE2P3vS9qtjtRSkYJUMiDjdWH0XgijqEAz873LFpaSOz5JlpA1bcVJZaEudfamLwB8FwetzM6Jg0Rvu2aHQsw/G382tGT+LjX/ls92ETote1KzvMVh/0hlcJiKHbawvG7M5dT6XxhwUlBUx9lVs8YwKwRYq6jOZZmxvGZmExVOAE2RH7mAP9k+DgwFV4pel01CK/GUlS5bTrfoLbLT00caOWiDUEOyEqywiLkg7DqoT4vlgVw5qiAkLXCRiJNXre/PhEh7dpB5e0C1a49amZMCtPoN1nYJy/E/rqUuKzyJkJDdLkqRR/xLTkA45qAdCXqZPgwsCi4cH2BNYyHRQ4XKxQtoWc4HzASlRg0+bfI+6EjhoIWOX4Z5ig8bZy9xhxc1YBt4+MNhCxL/Ov9suMi1tR2AZXzq4wRgwk3mpw+y2tjr8ddmjUd4S6bevBrH6BcgAGCUfZCoas6P7O9z51uX8gUqQu1FflHilbBNKZtkEMaTyESKjsyczV9miggl4uO13EN6BddrbWC/S98h3E290u0N6VyAl5lwJ8CwSf3TWooup9OK85BczBlLvPBkL2YQQWreVsZSkxZUYkCR9lDttjVfDyxtvlus7PCu8+HhSqdS1LK8vvE3j64tBptgFPkAFBH1a7tdlJnpL5Og3RoVqvECqlJS4OSLb+dCKDtrqpk/cAi0ej6MiKcKkgg6SyNPS+dASdrwx82hcktMHbbw5SXIpLcUrmuit7W93IQyzWlti4QWAogxagI2V7V3cLs1QGh3qLrwug6EcNdLOPRUhBSL6lKbNAnSpgV+0NnxHDNttHmfPrcqg7nhAH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(136003)(39860400002)(366004)(396003)(66556008)(66476007)(52536014)(8676002)(4326008)(478600001)(71200400001)(64756008)(66446008)(38070700005)(9686003)(26005)(86362001)(66946007)(82960400001)(76116006)(7696005)(921005)(6506007)(33656002)(41300700001)(2906002)(55016003)(8936002)(122000001)(38100700002)(186003)(110136005)(54906003)(7416002)(316002)(5660300002)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JStMyVVsXVU90DgHh8SPTQzAwIGpJU8SPuWUf06khb99NpUwxoUbihlVgm2D?=
 =?us-ascii?Q?I2R+FE7aGhNr20ql2TpY/jQJJB+KkNR1Ilm5mQECLc00xf5M/eb/k4muxUVv?=
 =?us-ascii?Q?PcNkbs9dq7mLrXs9maq3ibjSvlg3UzdYfrId2nWWRibq64eU2FgB82ShYnlO?=
 =?us-ascii?Q?/0pQWBm2cjdjFxw9z70HRo3KMXHylWkQ1+vSVUl4Kdxcr05L3uafELbwxrZP?=
 =?us-ascii?Q?BESrmRy9KtShcJT+5Q6/y+vDFC5v7eZsZyA03J2NE29tap4lnbKA873BogXf?=
 =?us-ascii?Q?z5E7r/mteCZgV1TBOMnXX5vw/R/DmDcAh5oc0bze19SDs1SRuycgHAh8Mvfz?=
 =?us-ascii?Q?Zze1WzaCRwNotJmFG4raREOvoA9aeteu7QReb34fP1T4zRN/cU0Kfy05ignI?=
 =?us-ascii?Q?zpajIWu0snoMbwOPG+pcOYXUoiXdDqtpOKUGTFcFiX4YcIbwAKkEf+ivJEvv?=
 =?us-ascii?Q?mrHmPrqyFXHxPnnPpZWL9kgcfwcP/LoYW0n3WMwcEUnbt8IhVuzqULFw4SzE?=
 =?us-ascii?Q?FY/pou+s/aaOVFt7ufFOvYqN9XSip26Pos8AGAFTjsC5kwbtWaiJqDuJlP9S?=
 =?us-ascii?Q?nOjZp1t31d28dGz/SvLZMz5Zx738qQ/71hRO29+jgJK4HF4j4RcenkV9+/1s?=
 =?us-ascii?Q?omTxh2Bd36Q+Hjn9wqqGrZW30J/6VC1Y47FUXHuUuIApc95anbmMWItjNTTP?=
 =?us-ascii?Q?o6W6S05/qkAr+BgITlrAm1WpghAm3TCTbvTNM065oGa1z4MXZ3Ufrsaig4Ov?=
 =?us-ascii?Q?kQrEyO+MyEHeuVypBkdbHA9H43qXfiTzt7MU3OypGLPLsRk/hAJZntb3eAiL?=
 =?us-ascii?Q?lkS22Id8/03uYd7NUysEEtjvcVfreK541ujGPkE0rPB+HAas6UknCUdi+Gq8?=
 =?us-ascii?Q?QOdhXi58bltdlQKxsmplo3Mn9M9bLbB7rfZz96ha22XumTpc//ELkdc2dhKE?=
 =?us-ascii?Q?iEaawJS8R0j9NnGixsvH5X3+Ut2C0H7zKU23mnaCUwWTDeMG68C3cDSAjaPD?=
 =?us-ascii?Q?QCboEWB2YPDPKHer28BdIS0DHQoubbWRstaIo3q/8ND2hafpmNCntpJ7h4fB?=
 =?us-ascii?Q?0kGjbg0MwTuOh6RlAjLNKotL8T5nLRpYDqHBfx6PhcfD9K/IN8ldPS/nR54N?=
 =?us-ascii?Q?atYx154H2Q4gV5KAwxLaWamWQ4ryZikbO3ojShGzEsZ02Ct2Mugd5p4F4IEb?=
 =?us-ascii?Q?ov/gIGI0Gm9fFFRwAX76KT0h56G4UgSnzDMOmfdGnrYiT0nKYOMJrOxsOq64?=
 =?us-ascii?Q?p4WeX3PSDqDcGoM+pbR0tc2MMxoiKcmFHaIQCqcIBuyf7g6DaK8n6ZTqd4sH?=
 =?us-ascii?Q?1Nt+IBtgh+yMYJ5FCP3KHbyGtrtGHYVHpWotJvjzc8Bs65y4cRD0LzbWlPgw?=
 =?us-ascii?Q?j9V28YmDr9VteFLvvwhTpJcd5NeQPYhvcxCFqpuKfhuxASvW8MkAdLSMFcN0?=
 =?us-ascii?Q?hrYEzRJp7RsVbpAov7x+IrVpEYctHOqIjbTTX1vRqjQ+e+V2ieFTHXCk3siU?=
 =?us-ascii?Q?CO0hfbGEOe8llTx9PTu58usVbx6CwU6VWL8sIwqCN5Ho0sWv7AlncsU59uhO?=
 =?us-ascii?Q?U8HiHZrrvx4mwnyoINsj2gIEB7Nu2if/L5kndEYD?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a141cad-7fa6-4ce7-ad49-08da5813c4eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 08:05:15.7124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 00NKej0sRjgdthrszf9B+uV8goxCLZI1YgXtjALn1uRhD8fPFG3jslPjC8MhzmT1EIiGlyfxcQUXW+fAKv8a2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5078
X-OriginatorOrg: intel.com
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

> From: Lu Baolu <baolu.lu@linux.intel.com>
> Sent: Tuesday, June 21, 2022 10:44 PM
> 
> Use this field to keep the number of supported PASIDs that an IOMMU
> hardware is able to support. This is a generic attribute of an IOMMU
> and lifting it into the per-IOMMU device structure makes it possible
> to allocate a PASID for device without calls into the IOMMU drivers.
> Any iommu driver that supports PASID related features should set this
> field before enabling them on the devices.
> 
> In the Intel IOMMU driver, intel_iommu_sm is moved to
> CONFIG_INTEL_IOMMU
> enclave so that the pasid_supported() helper could be used in dmar.c
> without compilation errors.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
