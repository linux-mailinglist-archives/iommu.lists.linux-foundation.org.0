Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E63D53A017
	for <lists.iommu@lfdr.de>; Wed,  1 Jun 2022 11:09:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB59283103;
	Wed,  1 Jun 2022 09:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zkwm6QDAxlWb; Wed,  1 Jun 2022 09:09:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 00617830E6;
	Wed,  1 Jun 2022 09:09:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2CC8C007E;
	Wed,  1 Jun 2022 09:09:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89E2EC002D
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 09:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6925C4011D
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 09:09:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gh7VOBIc3EBI for <iommu@lists.linux-foundation.org>;
 Wed,  1 Jun 2022 09:09:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F902400DB
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 09:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654074549; x=1685610549;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nxj2WP3PWFQTNznf6YdqtHibR0MtHqFcUohU/zrNOFc=;
 b=nDtjmdqFnjZ6jgeFzFcu9UBkfub98n/wusnQ+gtCRp7nWNo98BeHk8Kz
 7mPHVkEb8x94Y9JHpnClB3/sl+qvruPUGu1eeqdGfaVYysQvpPCQAKuoY
 5GArjVEdf8jebnKLTxNIi3FpJ1P8bY9Rb7VVWdreth1Yusx2UPZJpzfId
 IUMnpaMIXZSyBIampkxnCp7s6UFwZ5fDIswLLyjBNtyR9Hi0lzffa7lYV
 //je8q9GYpa491clN5DF9fp+kWZLvIkDjLaK9UM60HuoDIq7mQAZeV7cf
 3UYAeozLJTfl0/91Ev6iH5zJmwZIEUGSjIdXIE4ISYPuAcbK0Hn87D9Os A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="263162222"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="263162222"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 02:09:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="680002581"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2022 02:09:06 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 1 Jun 2022 02:09:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 1 Jun 2022 02:09:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 1 Jun 2022 02:09:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBcFsz1KJ0SlmN4bgBrA4+IiH1BFvuQL/yp7TKxDvCVUzaC1TqH4bKb7/MJSK1ZAKsaE7TKvaRcWH04jz9y7rjNFXpACjQetOA/8nw3uxHFE7VSqpykqooVhxNxqlH2fhohE39KhA3q992um4/jRjvR3rtCDuCAdb98aalmggzaQQBYnABH2P2LiBlHLx6ESvmrC6TZuNIB2/olzXp7r9uG8Q9tiQ10KIGzeq2y+NHIU+Q/3EI3B1orc5EeTYD2cTCAP0BOOUOJDfPE2uFlM7AdcBE4iRylDu+Xm83A9vR9IywlblPLIuRSsKHNP3wQzx/kdvqHLAaxANpfYLl/b4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTw3GgPQJdJH9wpzgYVPCXCtXVR46xs6SBINKnRtm70=;
 b=fakRGCQTMo8rUSgS7s24x64KY0l0+8qDrGXJqMHoZr8IlP8R8uMJ0rKTortGCOT0g4bSbX9adxljvRBOWgieMxv4j4AsuIor9BF4HVZiH8tDBMMaUPv+pw6Z+1JX4V+/9C00otPoteBZoxdx/NcxFZyH4HshtiYHW1Qm5nZzN6XxL2oX66Lx2ZPHKPDWfy5ABicuNEtn0cSkbMid6NaUOiBKK1KxdL8L5rSrnsdjzxCvLz9FMy/W1zTS1A5J8J9w1viuxuqnGx69yInWOgkKUlRDLlWrK6ccq8iLhZELJQiw78KWmgCeMUHLaUi4QpSHuCEgnjZWI+njCg4WHqtitw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN6PR11MB1906.namprd11.prod.outlook.com (2603:10b6:404:104::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15; Wed, 1 Jun
 2022 09:09:04 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a1cb:c445:9900:65c8]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a1cb:c445:9900:65c8%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 09:09:04 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, "Raj, 
 Ashok" <ashok.raj@intel.com>, Christoph Hellwig <hch@infradead.org>, "Jason
 Gunthorpe" <jgg@nvidia.com>
Subject: RE: [PATCH 06/12] iommu/vt-d: Acquiring lock in domain ID allocation
 helpers
Thread-Topic: [PATCH 06/12] iommu/vt-d: Acquiring lock in domain ID allocation
 helpers
Thread-Index: AQHYcZPMauL9C6pQNUuVWIoOmTZuBq06SrbA
Date: Wed, 1 Jun 2022 09:09:04 +0000
Message-ID: <BN9PR11MB52760F17D3B9359EB4BB2B7B8CDF9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220527063019.3112905-1-baolu.lu@linux.intel.com>
 <20220527063019.3112905-7-baolu.lu@linux.intel.com>
In-Reply-To: <20220527063019.3112905-7-baolu.lu@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a584c86-5010-4488-6604-08da43ae6052
x-ms-traffictypediagnostic: BN6PR11MB1906:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB1906C2762783E61A3B852AA28CDF9@BN6PR11MB1906.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dn/0Z/oE7o/WgtQn491GQ+UIzs7MSZ3DkuQhsLLV4xI/YtqN5xXq6gK/rC/q5GYCYrjYuzG5vGYnSlwj9kellakjUDesfTzZ8N/UN+8lOhEMB50FwyNiWGO1aw9t//4V3venP8RhMw4Ln8NMThcwU88Fm++L2Po/slQ0dfOKQ9jT46lh8R7YbZmAeTozPQ2A7uaoenml6MoH6b8+PU0+uoZdq2+l6ND5GuzjVhE/+Ys8N6xtrOFaSJ3CA9wK1psEs9zOmxZdjz+QVOeMde8Ey2EKe3wiA0gGijGq9Lb3my+DJGjDunpS/L/ZntZVd4CGjKGHKDTcx1nJDivTTe03WGZuxSn2KMp18AHcsC3BIbrKNMlPuB231LgLsl1qNSygmBrt54f2zvqUJKzbuN/9usq8ttHL9uADHN9EEUtIuYGmgMvZcc4sf6/J9eZPBMvnT3nqD9M2kWUo/tjB4tJToHhaSPt1Lo6OFTWmFulZg349iPcoXxl/S1UeMSvLQeWVH8nj8lpfjOujsDySD5Wfiq+5NwhaWg4ZISkyCbAUefs7UUf71BtzGuyyZFK+xSHPSjA3E7dkm6neh+8C9RNXI/eFkzfzsuQg2NmKETS/mzpqCTerOK+5NO5jaTEZkFhb7nX2jkdxUC71Rk+2b55sOw9XKqjfI8qFBk9IlQsUkiWO3RkiBO+uzMa2JjpmKnfL2Q3nl5SzJ12JX+ilezmUxQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(110136005)(66476007)(122000001)(64756008)(83380400001)(66446008)(33656002)(52536014)(54906003)(55016003)(66946007)(82960400001)(186003)(2906002)(8936002)(38100700002)(66556008)(71200400001)(26005)(7696005)(86362001)(8676002)(38070700005)(508600001)(5660300002)(316002)(4326008)(76116006)(6506007)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?76iqStVEVOTuaWRGULvhj2sTsIJnX594JSEpZ2giFVEXptCLNgFPJs81kRcN?=
 =?us-ascii?Q?gLKr2IdRCK2TS/Jm8OWfKFNKlna1mqjnCNsJSMEN6wE/zeUX0jOaZ3jLoou1?=
 =?us-ascii?Q?1NdmlI0wiDGA4BHsGrxLISGLKRQ39EAp+o44ahm/iHz5KvrXugdm5otwjqms?=
 =?us-ascii?Q?okmvzFHXcV/m3mqIFlC51TVB/NsShb2JJvBE4gLv9up/rxp+0/meCH/2lMEG?=
 =?us-ascii?Q?QAIpQRu8OrW1HX3x7l1TQ+1Ny4Q4uYiepM4NdbxyIrrrlJrZYe3NBTjxBt9N?=
 =?us-ascii?Q?o6mgKPHjDJ7MQd0tasYQdB3ITDvDHonU/9b1db5N1QN67zlX2g1DpW0qigjo?=
 =?us-ascii?Q?ZWF4WNcn0FZVda05GcpGRcqZECxVe2rdGvJ31kZvbkVuLIH077yhrCgFMOcV?=
 =?us-ascii?Q?KZ9bhe/LHZQcX9WizKIKOoOfbglhnuYdQIA+bHeXFkdo/YDFEvGUCXksPXiO?=
 =?us-ascii?Q?qGRWUJYN2bdIXaCLZP9TgWZoRpiYbDcfWHV2OjuMr2k8ba+6h2CKZKlqGcNw?=
 =?us-ascii?Q?0XVKzvsLNrKSoQuTulg5mzo63nPZI1A5GJdsrpOptCSyFOgmQ4sG9uHNH8PC?=
 =?us-ascii?Q?/ppEYyHRlOTz+NYRd2Y/bZe7vmFcklzxTA9f7nWVlVlzEd0Y8pg8hxkYgLGC?=
 =?us-ascii?Q?k71ckObMhBDD1lpG8qETWulhDFRnAzofw5hVo7ijvZ3LKFnbXbkhb4vm+/VU?=
 =?us-ascii?Q?hVjrqiBV6xYxv7wRWoom/m8xad+uzHypqWCxYCcsdWj7IedPwQqWJREXd3yB?=
 =?us-ascii?Q?DDin4Ug5qfS87Um6qXSoI5Y/kBabYFbhukqnKMAy07NpAyz6RYxEoCFC+WCJ?=
 =?us-ascii?Q?qrwCk4l3gtBKmoOpcHpdqZU6kfHVlup1NEGDCCBCosiL/yKAP6xHvtNlYRUv?=
 =?us-ascii?Q?VlqCnVrG4HCckzEqQ6uOQwvCNt0S8YylkODRRRCn/+yMBkW2vgLWrNN1uHGb?=
 =?us-ascii?Q?TXieUxNPHjNxpFyH/sRUuLHSiRXuUN+8HHQSLDDLpzEAY+2O+ouupxvMqH57?=
 =?us-ascii?Q?ixnaEGfgsKpp3z9w6cZdSkJmkWNwnch1EHqVWX+MVfsinPmjqyjEiwz8LK/t?=
 =?us-ascii?Q?AsNUF64KYlT0sn9YRQgEzXoDuneE2bUwy5d/UqOURxpVpS5PNkJ0PDO82K9v?=
 =?us-ascii?Q?VWJO6X/gy2NxQMgJLvTmOFixO0gcIFBTCKrJ4uvoQZcJIok/Cxv+rPTFcroG?=
 =?us-ascii?Q?InavLvI/9u3HRILXZcwdWXSv2mOgHiynJkEfVNFfLhZm/1pCUTOrVz4xEt2F?=
 =?us-ascii?Q?WJo8N72YqDci+dwjEVWwEy2hAir72F9sYdeEXgwj+mQv9n1t0cO00iED2LKe?=
 =?us-ascii?Q?mmkKCcqAMKIr1I7d/MR3lf2ph0gnHdiZzLzU8Usdda9pi6LtASsDU30TOYPw?=
 =?us-ascii?Q?Yp4boFqYxwFzo/QdUSFCw+cEL92N4Fs7Zc17EWVcJxqMITH2Ez8OD1MHvZPD?=
 =?us-ascii?Q?vxoR2lTa2rOVnPe6UoBTNjOar25p9JMzNb3JJrR7QbAw9uROX5ADZ3xdRkMP?=
 =?us-ascii?Q?BQsy13DipaXPdnQ20dbuf9Pt5G+Jo23xi3Vky/vt8ReIu3rB7wqpWC+lVmnR?=
 =?us-ascii?Q?p8q2u/LTJPODBKnFFdOJPVlrGdFSXDAGGZQavl0pcf/yCe9swtjDJRre3KvL?=
 =?us-ascii?Q?2ZFdNhbl8tXgIOnVdzm3VYmZKlIl3qaUlBQ1rKY3C/5KAXFF/35SnyAcV/Ty?=
 =?us-ascii?Q?VOX77m1KH1IaOrGsy3OnfPzhA10TbGEJzDObpZb+2DH2A6sk+jS4PwRE7a5X?=
 =?us-ascii?Q?aerC0m+K2Q=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a584c86-5010-4488-6604-08da43ae6052
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 09:09:04.5104 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KOOkMN+3vC+lmgeWCmkBQ+C0ITFpR6hMsJ5+8IJMmGOdBqeMFYxDU5eMLrcaGPgx0L2e/PBkOQTqSXxzULaxmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1906
X-OriginatorOrg: intel.com
Cc: Will Deacon <will@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>, Robin Murphy <robin.murphy@arm.com>
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
> Sent: Friday, May 27, 2022 2:30 PM
> 
> The iommu->lock is used to protect the per-IOMMU domain ID resource.
> Move the spinlock acquisition/release into the helpers where domain
> IDs are allocated and freed. The device_domain_lock is irrelevant to
> domain ID resources, remove its assertion as well.

while moving the lock you also replace spin_lock_irqsave() with spin_lock().
It'd be cleaner to just do movement here and then replace all _irqsave()
in patch 8.

> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/iommu/intel/iommu.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 2d5f02b85de8..0da937ce0534 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -1774,16 +1774,13 @@ static struct dmar_domain
> *alloc_domain(unsigned int type)
>  	return domain;
>  }
> 
> -/* Must be called with iommu->lock */
>  static int domain_attach_iommu(struct dmar_domain *domain,
>  			       struct intel_iommu *iommu)
>  {
>  	unsigned long ndomains;
> -	int num;
> -
> -	assert_spin_locked(&device_domain_lock);
> -	assert_spin_locked(&iommu->lock);
> +	int num, ret = 0;
> 
> +	spin_lock(&iommu->lock);
>  	domain->iommu_refcnt[iommu->seq_id] += 1;
>  	if (domain->iommu_refcnt[iommu->seq_id] == 1) {
>  		ndomains = cap_ndoms(iommu->cap);
> @@ -1792,7 +1789,8 @@ static int domain_attach_iommu(struct
> dmar_domain *domain,
>  		if (num >= ndomains) {
>  			pr_err("%s: No free domain ids\n", iommu->name);
>  			domain->iommu_refcnt[iommu->seq_id] -= 1;
> -			return -ENOSPC;
> +			ret = -ENOSPC;
> +			goto out_unlock;
>  		}
> 
>  		set_bit(num, iommu->domain_ids);
> @@ -1801,7 +1799,9 @@ static int domain_attach_iommu(struct
> dmar_domain *domain,
>  		domain_update_iommu_cap(domain);
>  	}
> 
> -	return 0;
> +out_unlock:
> +	spin_unlock(&iommu->lock);
> +	return ret;
>  }
> 
>  static void domain_detach_iommu(struct dmar_domain *domain,
> @@ -1809,9 +1809,7 @@ static void domain_detach_iommu(struct
> dmar_domain *domain,
>  {
>  	int num;
> 
> -	assert_spin_locked(&device_domain_lock);
> -	assert_spin_locked(&iommu->lock);
> -
> +	spin_lock(&iommu->lock);
>  	domain->iommu_refcnt[iommu->seq_id] -= 1;
>  	if (domain->iommu_refcnt[iommu->seq_id] == 0) {
>  		num = domain->iommu_did[iommu->seq_id];
> @@ -1819,6 +1817,7 @@ static void domain_detach_iommu(struct
> dmar_domain *domain,
>  		domain_update_iommu_cap(domain);
>  		domain->iommu_did[iommu->seq_id] = 0;
>  	}
> +	spin_unlock(&iommu->lock);
>  }
> 
>  static inline int guestwidth_to_adjustwidth(int gaw)
> @@ -2471,9 +2470,7 @@ static int domain_add_dev_info(struct
> dmar_domain *domain, struct device *dev)
> 
>  	spin_lock_irqsave(&device_domain_lock, flags);
>  	info->domain = domain;
> -	spin_lock(&iommu->lock);
>  	ret = domain_attach_iommu(domain, iommu);
> -	spin_unlock(&iommu->lock);
>  	if (ret) {
>  		spin_unlock_irqrestore(&device_domain_lock, flags);
>  		return ret;
> @@ -4158,7 +4155,6 @@ static void __dmar_remove_one_dev_info(struct
> device_domain_info *info)
>  {
>  	struct dmar_domain *domain;
>  	struct intel_iommu *iommu;
> -	unsigned long flags;
> 
>  	assert_spin_locked(&device_domain_lock);
> 
> @@ -4179,10 +4175,7 @@ static void __dmar_remove_one_dev_info(struct
> device_domain_info *info)
>  	}
> 
>  	list_del(&info->link);
> -
> -	spin_lock_irqsave(&iommu->lock, flags);
>  	domain_detach_iommu(domain, iommu);
> -	spin_unlock_irqrestore(&iommu->lock, flags);
>  }
> 
>  static void dmar_remove_one_dev_info(struct device *dev)
> --
> 2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
